LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_MAQUINA_DE_ESTADOS IS
END TB_MAQUINA_DE_ESTADOS;
 
ARCHITECTURE behavior OF TB_MAQUINA_DE_ESTADOS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MAQUINA_DE_ESTADOS
    PORT(
         CLOCK_ME : IN  std_logic;
         RESET : IN  std_logic;
         INPUT : IN  std_logic_vector(3 downto 0);
         LEDS : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK_ME : std_logic := '0';
   signal RESET : std_logic := '0';
   signal INPUT : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal LEDS : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLOCK_ME_period : time := 10 ns;
 
BEGIN
 
-- Processo de simulação dos estímulos
    sim_stimulus_process: process
    begin
        -- Testa cada estado da máquina de estados
        RESET <= '1';  -- Ativa o reset inicialmente
        WAIT FOR 10 ns;
        RESET <= '0';  -- Desativa o reset

        -- Teste do estado "000"
        INPUT <= "0000";  -- Simula INPUT
		  CLOCK_ME <= '1';
		  CLOCK_ME <= '0';
        WAIT FOR 10 ns;

        -- Teste do estado "001"

        INPUT <= "0001";  -- Simula INPUT
        WAIT FOR 10 ns;

        -- Teste do estado "010"

        INPUT <= "0010";  -- Simula INPUT
        WAIT FOR 10 ns;

        -- Teste do estado "011"

        INPUT <= "0011";  -- Simula INPUT
        WAIT FOR 10 ns;

        -- Teste do estado "100"

        INPUT <= "0100";  -- Simula INPUT
        WAIT FOR 10 ns;

        -- Teste do estado "101"

        INPUT <= "0101";  -- Simula INPUT
        WAIT FOR 10 ns;

        -- Teste do estado "110"

        INPUT <= "0110";  -- Simula INPUT
        WAIT FOR 10 ns;

        -- Teste do estado "111"

        INPUT <= "0111";  -- Simula INPUT
        WAIT FOR 10 ns;

        -- Outros testes conforme necessário

        -- Fim da simulação
        WAIT;
    end process;

END;

