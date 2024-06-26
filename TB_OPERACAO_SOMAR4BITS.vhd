LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY TB_OPERACAO_SOMAR4BITS IS
END TB_OPERACAO_SOMAR4BITS;
 
ARCHITECTURE behavior OF TB_OPERACAO_SOMAR4BITS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OPERACAO_SOMAR4BITS
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         CARRY_IN : IN  std_logic;
         Z : OUT  std_logic_vector(3 downto 0);
         CARRY_OUT : OUT  std_logic;
         FLAG_RESULTADO_NULO : OUT  std_logic;
         FLAG_OVERFLOW : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal CARRY_IN : std_logic := '0';

 	--Outputs
   signal Z : std_logic_vector(3 downto 0);
   signal CARRY_OUT : std_logic;
   signal FLAG_RESULTADO_NULO : std_logic;
   signal FLAG_OVERFLOW : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OPERACAO_SOMAR4BITS PORT MAP (
          A => A,
          B => B,
          CARRY_IN => CARRY_IN,
          Z => Z,
          CARRY_OUT => CARRY_OUT,
          FLAG_RESULTADO_NULO => FLAG_RESULTADO_NULO,
          FLAG_OVERFLOW => FLAG_OVERFLOW
        );


 



   STIM_PROC: PROCESS
   BEGIN
		A <= "0000";
		B <= "0000";
      WAIT FOR 100 NS;
		A <= "0101";
		B <= "0011";
		WAIT FOR 100 NS;
		A <= "1111";
		B <= "1111";
		WAIT FOR 100 NS;
   END PROCESS;

END;
