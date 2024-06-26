--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:35:45 05/31/2024
-- Design Name:   
-- Module Name:   C:/Users/DANIEL/Desktop/SD/ULA_FINAL/TB_OPERACAO_NOT.vhd
-- Project Name:  ULA_FINAL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OPERACAO_NOT
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
 
ENTITY TB_OPERACAO_NOT IS
END TB_OPERACAO_NOT;
 
ARCHITECTURE behavior OF TB_OPERACAO_NOT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OPERACAO_NOT
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         Z : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic_vector(3 downto 0);
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OPERACAO_NOT PORT MAP (
          A => A,
          Z => Z
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      -- insert stimulus here 
		A <= "0001";
      wait;
   end process;

END;
