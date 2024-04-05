// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract Enum {
    // Enum representando o status do envio
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // O valor padrão é o primeiro elemento listado na 
    // definição do tipo, neste caso "Pending"
    Status public status;

    // Retorna uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Atualize o status passando uint na entrada
    function set(Status _status) public {
        status = _status;
    }

    // Você pode atualizar para um enum específico como este
    function cancel() public {
        status = Status.Canceled;
    }

    // delete - redefine o enum para seu primeiro valor, 0
    function reset() public {
        delete status;
    }
}