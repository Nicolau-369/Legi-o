// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract DadosPrimitivos {
    bool public verdade = true;

    /*
    uint representa um valor inteiro sem sinal, ou seja, inteiros positivos >= 0
    pode ser definido para diferentes tamanhos
        uint8   varia de 0 até 2 ** 8 - 1
        uint16  varia de 0 até 2 ** 16 - 1
        ...
        uint256 varia de 0 até 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint é o mesmo que uint256

    /*
    Para números negativos, deve se usar o tipo int
    Assim como no uint, podemos definir diferentes 
    faixas de int que são int8 até int256
    
    int256 varia de -2 ** 255 até 2 ** 255 - 1
    int128 varia de -2 ** 127 até 2 ** 127 - 1
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int é o mesmo que int256

    // mínimo e máximo de int
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    // Nosso endereço, caso sinta-se a vontade para nos enviar alguns bnb's :)
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*
    Em Solidity, o tipo de dados byte representa uma sequência de bytes. 
    Solidity apresenta dois tipos de bytes :

     - matrizes de bytes de tamanho fixo
     - matrizes de bytes de tamanho dinâmico.
     
     O termo bytes no Solidity representa uma matriz dinâmica de bytes.
     É uma abreviação para byte[] .
    */
    bytes1 a = 0xb5; //  [10110101]
    bytes1 b = 0x56; //  [01010110]
    
    // Valores padrão
    // Variáveis não atribuídas têm um valor padrão
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}