LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TB_CLOCK_DIVIDER IS
    -- ESTA ENTIDADE NÃO POSSUI PORTAS.
END TB_CLOCK_DIVIDER;

ARCHITECTURE BEHAVIORAL OF TB_CLOCK_DIVIDER IS

    -- DECLARAÇÃO DO COMPONENTE PARA O UNIT UNDER TEST (UUT)
    COMPONENT CLOCK_DIVIDER
    PORT ( CLK_IN : IN STD_LOGIC;
           RESET  : IN STD_LOGIC;
           CLK_OUT : OUT STD_LOGIC);
    END COMPONENT;

    -- SINAIS PARA CONEXÃO AO UUT
    SIGNAL CLK_IN : STD_LOGIC := '0';  -- Sinal para simular entrada de clock
    SIGNAL RESET : STD_LOGIC := '0';   -- Sinal para simular entrada de reset
    SIGNAL CLK_OUT : STD_LOGIC;        -- Sinal para capturar saída de clock

    -- DEFINIÇÕES DE PERÍODO DE CLOCK
    CONSTANT CLK_PERIOD : TIME := 1 SEC;  -- Período do clock simulado (1 segundo)

BEGIN

    -- INSTANCIAÇÃO DO UNIT UNDER TEST (UUT)
    UUT: CLOCK_DIVIDER PORT MAP (
        CLK_IN => CLK_IN,
        RESET => RESET,
        CLK_OUT => CLK_OUT
    );

    -- PROCESSO DE DEFINIÇÕES DO CLOCK
    CLK_PROCESS :PROCESS
    BEGIN
        CLK_IN <= '0';                    -- Define valor inicial de CLK_IN
        WAIT FOR CLK_PERIOD/2;            -- Aguarda metade do período de CLK_PERIOD
        CLK_IN <= '1';                    -- Alterna CLK_IN para '1'
        WAIT FOR CLK_PERIOD/2;            -- Aguarda mais metade do período de CLK_PERIOD
    END PROCESS;

    -- PROCESSO DE ESTÍMULO
    STIM_PROC: PROCESS
    BEGIN        
        RESET <= '1';                     -- Sinaliza RESET por 100 ns
        WAIT FOR 100 NS;  

        RESET <= '0';                     -- Cancela RESET
        WAIT FOR 2.5 SEC;                   -- Ajuste para esperar 5 segundos

        RESET <= '1';                     -- Sinaliza RESET novamente após 5 segundos
        WAIT FOR 100 NS;

        RESET <= '0';                     -- Cancela RESET novamente
        WAIT FOR 2.5 SEC;

        WAIT;                             -- Finaliza simulação
    END PROCESS;

END BEHAVIORAL;
