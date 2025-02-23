LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY CLOCK_AJUSTADO IS
    PORT (
        CLK_IN : IN STD_LOGIC;       -- CLOCK DE ENTRADA DE 50 MHZ
        RST    : IN STD_LOGIC;       -- RESET ASS�NCRONO
        CLOCK_DE_SAIDA: OUT STD_LOGIC       -- CLOCK DE SA�DA AJUSTADO
    );
END ENTITY CLOCK_AJUSTADO;

ARCHITECTURE BEHAVIORAL OF CLOCK_AJUSTADO IS
    CONSTANT DIVISOR : INTEGER := 250000000;  -- DIVISOR PARA REDUZIR A FREQU�NCIA

    SIGNAL CONTADOR : INTEGER RANGE 0 TO DIVISOR - 1 := 0;
    SIGNAL CLOCK_DE_SAIDA_INTERNO : STD_LOGIC := '0';

BEGIN
    PROCESS(CLK_IN, RST)
    BEGIN
        IF RST = '1' THEN
            CONTADOR <= 0;               							-- REINICIA O CONTADOR EM CASO DE RESET
            CLOCK_DE_SAIDA_INTERNO <= '0';    							-- GARANTE QUE O CLOCK DE SA�DA COMECE EM '0'
        ELSIF RISING_EDGE(CLK_IN) THEN
            IF CONTADOR = DIVISOR - 1 THEN							-- AQUI PASSARAM-SE 5 SEGUNDOS
                CONTADOR <= 0;           							-- REINICIA O CONTADOR QUANDO ATINGE O DIVISOR
                CLOCK_DE_SAIDA_INTERNO <= NOT CLOCK_DE_SAIDA_INTERNO;  	-- INVERTE O CLOCK DE SA�DA INTERNO
            ELSE
                CONTADOR <= CONTADOR + 1; 							-- INCREMENTA O CONTADOR
            END IF;
        END IF;
    END PROCESS;

    CLOCK_DE_SAIDA <= CLOCK_DE_SAIDA_INTERNO;    -- SA�DA DO CLOCK DE SA�DA AJUSTADO

END ARCHITECTURE BEHAVIORAL;
