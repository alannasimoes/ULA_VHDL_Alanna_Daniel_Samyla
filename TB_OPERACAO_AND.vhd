--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:47:18 05/31/2024
-- Design Name:   
-- Module Name:   C:/Users/DANIEL/Desktop/SD/ULA_FINAL/TB_OPERACAO_AND.vhd
-- Project Name:  ULA_FINAL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OPERACAO_AND
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
 
ENTITY TB_OPERACAO_AND IS
END TB_OPERACAO_AND;
 
ARCHITECTURE behavior OF TB_OPERACAO_AND IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OPERACAO_AND
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         Z : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OPERACAO_AND PORT MAP (
          A => A,
          B => B,
          Z => Z
        );
   -- Stimulus process
   stim_proc: process
   begin		
		A <= "0001";
		B <= "0000";
		wait for 1000000000 ns;
      wait;
   end process;

END;
