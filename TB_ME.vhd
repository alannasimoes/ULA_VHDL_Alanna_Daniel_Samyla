--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:04:44 06/22/2024
-- Design Name:   
-- Module Name:   C:/Users/DANIEL/Desktop/ULA_FINAL/TB_ME.vhd
-- Project Name:  ULA_FINAL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MAQUINA_DE_ESTADOS
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ME IS
END TB_ME;
 
ARCHITECTURE behavior OF TB_ME IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MAQUINA_DE_ESTADOS
    PORT(
         INPUT : IN  std_logic_vector(3 downto 0);
         BOTAO_A : IN  std_logic;
         BOTAO_B : IN  std_logic;
         BOTAO_SEL : IN  std_logic;
         BOTAO_RESULT : IN  std_logic;
         BOTAO_FLAG : IN  std_logic;
         LEDS : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INPUT : std_logic_vector(3 downto 0) := (others => '0');
   signal BOTAO_A : std_logic := '0';
   signal BOTAO_B : std_logic := '0';
   signal BOTAO_SEL : std_logic := '0';
   signal BOTAO_RESULT : std_logic := '0';
   signal BOTAO_FLAG : std_logic := '0';

 	--Outputs
   signal LEDS : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MAQUINA_DE_ESTADOS PORT MAP (
          INPUT => INPUT,
          BOTAO_A => BOTAO_A,
          BOTAO_B => BOTAO_B,
          BOTAO_SEL => BOTAO_SEL,
          BOTAO_RESULT => BOTAO_RESULT,
          BOTAO_FLAG => BOTAO_FLAG,
          LEDS => LEDS
        );


      -- insert stimulus here 
process
begin
   BOTAO_A <= '1';
   INPUT <= "0001";
   wait for 10 ns;
   -------------------
   BOTAO_A <= '0';
   BOTAO_B <= '1';
   INPUT <= "0010";
   wait for 10 ns;
   BOTAO_B <= '0';
   BOTAO_SEL <= '1';
   INPUT <= "1000";
   wait for 10 ns;
   BOTAO_SEL <= '0';
   BOTAO_RESULT <= '1';
   wait for 10 ns;
	BOTAO_RESULT <= '0';
	BOTAO_FLAG <= '1';
	wait for 10 ns;
   wait;
end process;


END;
