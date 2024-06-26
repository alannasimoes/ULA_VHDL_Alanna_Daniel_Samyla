library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
entity OPERACAO_SOMAR1BIT is
 Port(
        A, B, CARRY_IN : in  std_logic;
        Z, CARRY_OUT   : out std_logic
    );
end OPERACAO_SOMAR1BIT;
---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
architecture Behavioral of OPERACAO_SOMAR1BIT is
begin
	-- Realiza a soma de 1 bit
   Z <= A xor B xor CARRY_IN; 
	-- Calcula o carry out
	CARRY_OUT <= (A and B) or (B and CARRY_IN) or (A and CARRY_IN);
end Behavioral;

