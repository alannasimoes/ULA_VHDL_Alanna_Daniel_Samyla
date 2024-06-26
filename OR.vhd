library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
entity OPERACAO_OR is
	Port(A,B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Z: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end OPERACAO_OR;
---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
architecture Behavioral of OPERACAO_OR is

begin
Z <= A OR B;
end Behavioral;
