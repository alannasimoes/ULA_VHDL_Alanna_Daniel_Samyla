LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
-----------------------------------------------------------------------------------
-------------------------------------ENTIDADE--------------------------------------
-----------------------------------------------------------------------------------
ENTITY MAQUINA_DE_ESTADOS IS
PORT(
INPUT : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
BOTAO_A, BOTAO_B, BOTAO_SEL, BOTAO_RESULT, BOTAO_FLAG: IN STD_LOGIC;
LEDS : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END MAQUINA_DE_ESTADOS;
-------------------------------------------------------------------------------
----------------------------------ARQUITETURA----------------------------------
-------------------------------------------------------------------------------
ARCHITECTURE BEHAVIORAL OF MAQUINA_DE_ESTADOS IS
-------------------------------------------------------------------------------
----------------------------------SINAIS---------------------------------------
-------------------------------------------------------------------------------
--- SINAIS DA MAQUINA DE ESTADO
SIGNAL A_ME, B_ME, RESULTADO_ME : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL SELETOR_ME : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL FLAG_CARRY_OUT_ME, FLAG_RESULTADO_NULO_ME, FLAG_OVERFLOW_ME, FLAG_RESULTADO_NEGATIVO_ME: STD_LOGIC;

-------------------------------------------------------------------------------
----------------------------------COMPONENTES----------------------------------
-------------------------------------------------------------------------------
COMPONENT ULA IS
PORT(
A_ULA : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        B_ULA : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        SEL_ULA : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        RESULTADO_ULA : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		FLAG_CARRY_OUT_ULA : OUT STD_LOGIC;
		FLAG_RESULTADO_NULO_ULA : OUT STD_LOGIC;
		FLAG_OVERFLOW_ULA : OUT STD_LOGIC;
		FLAG_RESULTADO_NEGATIVO_ULA : OUT  STD_LOGIC
    );
END COMPONENT;

BEGIN
--------------------------------
-- INSTANCIA DO COMPONENTE ULA
--------------------------------
    INSTANCIA_DA_ULA : ULA
    PORT MAP (
        A_ULA => A_ME,
        B_ULA => B_ME,
        SEL_ULA => SELETOR_ME, --- ESTOU USANDO OS 3 PRIMEIROS BITS PARA SELECIONAR
        RESULTADO_ULA => RESULTADO_ME,
        FLAG_CARRY_OUT_ULA => FLAG_CARRY_OUT_ME,              
        FLAG_RESULTADO_NULO_ULA => FLAG_RESULTADO_NULO_ME,
        FLAG_OVERFLOW_ULA => FLAG_OVERFLOW_ME,
        FLAG_RESULTADO_NEGATIVO_ULA => FLAG_RESULTADO_NEGATIVO_ME
    );
-------------------------------------------------------------------------------
----------------------------------INICIO---------------------------------------
-------------------------------------------------------------------------------
    PROCESS(BOTAO_A, BOTAO_B, BOTAO_SEL, BOTAO_RESULT, BOTAO_FLAG)
	 BEGIN
		IF BOTAO_A = '1' THEN
			A_ME <= INPUT(3 DOWNTO 0); 		--  OPERANDO A DA MAQUINA DE ESTADOS RECEBE O VALOR DOS SWITCHES
			LEDS(3 DOWNTO 0) <= "0001";		-- LEDS INDICAM NOSSO ESTADO (NAO ESTA EM BINARIO)
			LEDS(7 DOWNTO 4) <= INPUT(3 DOWNTO 0);		-- LEDS MOSTRAM O NOSSO VALOR DE INPUT
		-------------------------------------------------------------------------------------------------------------
		ELSIF BOTAO_B = '1' THEN
			B_ME <= INPUT(3 DOWNTO 0); 		--  OPERANDO B DA MAQUINA DE ESTADOS RECEBE O VALOR DOS SWITCHES
			LEDS(3 DOWNTO 0) <= "0010";		-- LEDS INDICAM NOSSO ESTADO (NAO ESTA EM BINARIO)
			LEDS(7 DOWNTO 4) <= INPUT(3 DOWNTO 0);		-- LEDS MOSTRAM O NOSSO VALOR DE INPUT
		-------------------------------------------------------------------------------------------------------------
		ELSIF BOTAO_SEL = '1' THEN
			SELETOR_ME <= INPUT(3 DOWNTO 1); 		-- SELETOR DA MAQUINA DE ESTADOS RECEBE O VALOR DOS SWITCHES
			LEDS(3 DOWNTO 0) <= "0100";		-- LEDS INDICAM NOSSO ESTADO (NAO ESTA EM BINARIO)
			LEDS(6 DOWNTO 4) <= INPUT(3 DOWNTO 1);		-- LEDS MOSTRAM O NOSSO VALOR DE INPUT
			LEDS(7) <= '0';
		-------------------------------------------------------------------------------------------------------------
		ELSIF BOTAO_RESULT = '1' THEN
			LEDS(7 DOWNTO 4) <= RESULTADO_ME;-- LEDS MOSTRAM O NOSSO VALOR DO NOSSO RESULTADO
			LEDS(3 DOWNTO 0) <= "1000"; 		-- LEDS INDICAM NOSSO ESTADO
		-------------------------------------------------------------------------------------------------------------
		ELSIF BOTAO_FLAG= '1' THEN
			-- INDICANDO QUAIS LEDS RECEBEM AS DETERMINADAS FLAGS
			LEDS(7) <= FLAG_RESULTADO_NEGATIVO_ME;
			LEDS(6) <= FLAG_RESULTADO_NULO_ME;
			LEDS(5) <= FLAG_OVERFLOW_ME;
			LEDS(4) <= FLAG_CARRY_OUT_ME;
			LEDS(3 DOWNTO 0) <= "0000"; --- 4 LEDS "MENOS SIGNIFICATIVOS" (DA DIREITA) APAGAM
		END IF;
	END PROCESS;

END BEHAVIORAL;