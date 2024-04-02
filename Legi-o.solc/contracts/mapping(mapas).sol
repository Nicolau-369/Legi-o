// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Mapping {
    // Mapeamento de endereço para uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // O mapeamento sempre retorna um valor
        // Se o valor do mapa nunca foi definido, 
        // ele irá retornar o valor padrão para o tipo de variável atribuindo
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        // Atualiza o valor do mapa para o endereço informado
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        // Deleta o valor existente para o endereço informado
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Mapeamento aninhado (mapeamento de endereço para outro mapeamento)
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // Você pode obter valores de um mapeamento aninhado
        // mesmo quando não é inicializado
        return nested[_addr1][_i];
    }

    function set(
        address _addr1,
        uint _i,
        bool _boo
    ) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
}