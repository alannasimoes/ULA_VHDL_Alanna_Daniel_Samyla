library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
entity OPERACAO_XOR is
	Port(
	A,B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Z: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end OPERACAO_XOR;
---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
architecture Behavioral of OPERACAO_XOR is
begin
Z <= A XOR B;
end Behavioral;

