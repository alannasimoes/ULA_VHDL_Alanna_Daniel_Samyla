library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
entity OPERACAO_AND is
	Port(
	A,B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Z: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end OPERACAO_AND;
---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
architecture Behavioral of OPERACAO_AND is

begin
Z <= A AND B;
end Behavioral; 