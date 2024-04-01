// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract MultiSigWallet {
    // Declaração dos eventos que serão emitidos através da chamada
    // das funções pelo contrato
    event Deposit(address indexed sender, uint amount, uint balance);
    event SubmitTransaction(
        address indexed owner,
        uint indexed txIndex,
        address indexed to,
        uint value,
        bytes data
    );
    event ConfirmTransaction(address indexed owner, uint indexed txIndex);
    event RevokeConfirmation(address indexed owner, uint indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint indexed txIndex);

    // Array onde ficarão armazenados os endereços de carteiras
    // dos proprietários
    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public numConfirmationsRequired;

    // Estrutura de uma transação dentro do contrato
    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
        uint numConfirmations;
    }

    // Mapa que servirá de armazenamento para verificar
    // se as transações foram confirmadas ou não
    // mapping from tx index => owner => bool
    mapping(uint => mapping(address => bool)) public isConfirmed;

    Transaction[] public transactions;

    // Verifica se a carteira que está solicitando
    // uma transação é um proprietário
    modifier onlyOwner() {
        require(isOwner[msg.sender], "Nao e o proprietario");
        _;
    }

    // Verifica se uma hash de transação existe
    modifier txExists(uint _txIndex) {
        require(_txIndex < transactions.length, "Transacao nao existe");
        _;
    }

    // Verifica se a transação já foi executada
    modifier notExecuted(uint _txIndex) {
        require(!transactions[_txIndex].executed, "Transacao ja executada");
        _;
    }

    // Verifica se a transação já foi confirmada
    modifier notConfirmed(uint _txIndex) {
        require(!isConfirmed[_txIndex][msg.sender], "Transacao ja confirmada");
        _;
    }


    // Construtor do contrato da carteira
    constructor(address[] memory _owners, uint _numConfirmationsRequired) {
        require(_owners.length > 0, "proprietarios necessarios");
        require(
            _numConfirmationsRequired > 0 &&
                _numConfirmationsRequired <= _owners.length,
            "numero invalido de confirmacoes necessarias"
        );

        for (uint i = 0; i < _owners.length; i++) {
            address owner = _owners[i];

            require(owner != address(0), "proprietario invalido");
            require(!isOwner[owner], "proprietario nao e unico");

            isOwner[owner] = true;
            owners.push(owner);
        }

        numConfirmationsRequired = _numConfirmationsRequired;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value, address(this).balance);
    }

    // Função que irá enviar uma transação
    function submitTransaction(
        address _to,
        uint _value,
        bytes memory _data
    ) public onlyOwner {
        uint txIndex = transactions.length;

        transactions.push(
            Transaction({
                to: _to,
                value: _value,
                data: _data,
                executed: false,
                numConfirmations: 0
            })
        );

        emit SubmitTransaction(msg.sender, txIndex, _to, _value, _data);
    }

    // Função que irá confirmar a transação por meio do
    // hash da transação passada por parâmetro
    function confirmTransaction(uint _txIndex)
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex)
        notConfirmed(_txIndex)
    {
        Transaction storage transaction = transactions[_txIndex];
        transaction.numConfirmations += 1;
        isConfirmed[_txIndex][msg.sender] = true;

        emit ConfirmTransaction(msg.sender, _txIndex);
    }

    // Função que irá executar a transação
    function executeTransaction(uint _txIndex)
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex)
    {
        Transaction storage transaction = transactions[_txIndex];

        require(
            transaction.numConfirmations >= numConfirmationsRequired,
            "Nao pode executar a transacao"
        );

        transaction.executed = true;

        (bool success, ) = transaction.to.call{value: transaction.value}(
            transaction.data
        );
        require(success, "Transacao falhou");

        emit ExecuteTransaction(msg.sender, _txIndex);
    }

    // Função que irá revogar a aprovação de uma transação
    // através do hash passado por parâmetro
    function revokeConfirmation(uint _txIndex)
        public
        onlyOwner
        txExists(_txIndex)
        notExecuted(_txIndex)
    {
        Transaction storage transaction = transactions[_txIndex];

        require(isConfirmed[_txIndex][msg.sender], "Transacao nao confirmada");

        transaction.numConfirmations -= 1;
        isConfirmed[_txIndex][msg.sender] = false;

        emit RevokeConfirmation(msg.sender, _txIndex);
    }

    // Retorna a lista de proprietários da carteira
    function getOwners() public view returns (address[] memory) {
        return owners;
    }

    // Retorna a quantidade de transações existentes
    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }

    // Retorna uma transação através do hash passado por parâmetro
    function getTransaction(uint _txIndex)
        public
        view
        returns (
            address to,
            uint value,
            bytes memory data,
            bool executed,
            uint numConfirmations
        )
    {
        Transaction storage transaction = transactions[_txIndex];

        return (
            transaction.to,
            transaction.value,
            transaction.data,
            transaction.executed,
            transaction.numConfirmations
        );
    }
}
