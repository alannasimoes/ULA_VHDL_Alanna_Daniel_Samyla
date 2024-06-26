LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
ENTITY MUX_8ENTRADAS IS
		  PORT (
        INPUT_0 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        INPUT_1 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        INPUT_2 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        INPUT_3 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        INPUT_4 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        INPUT_5 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        INPUT_6 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        INPUT_7 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        SEL     : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        OUTPUT  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY MUX_8ENTRADAS;
---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
ARCHITECTURE BEHAVIORAL OF MUX_8ENTRADAS IS
BEGIN

    PROCESS(SEL, INPUT_0, INPUT_1, INPUT_2, INPUT_3, INPUT_4, INPUT_5, INPUT_6, INPUT_7)
    BEGIN
        CASE SEL IS
            WHEN "000" =>
                OUTPUT <= INPUT_0;
            WHEN "001" =>
                OUTPUT <= INPUT_1;
            WHEN "010" =>
                OUTPUT <= INPUT_2;
            WHEN "011" =>
                OUTPUT <= INPUT_3;
            WHEN "100" =>
                OUTPUT <= INPUT_4;
            WHEN "101" =>
                OUTPUT <= INPUT_5;
            WHEN "110" =>
                OUTPUT <= INPUT_6;
            WHEN "111" =>
                OUTPUT <= INPUT_7;
            WHEN OTHERS =>
                OUTPUT <= "0000"; -- COMPORTAMENTO PADRAO
        END CASE;
    END PROCESS;

END ARCHITECTURE BEHAVIORAL;


