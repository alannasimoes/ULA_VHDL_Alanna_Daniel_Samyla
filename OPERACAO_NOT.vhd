LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
ENTITY OPERACAO_NOT IS
	PORT(A: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Z: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END OPERACAO_NOT;
---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
ARCHITECTURE BEHAVIORAL OF OPERACAO_NOT IS

BEGIN
Z <= NOT A;
END BEHAVIORAL;
