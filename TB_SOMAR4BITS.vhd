--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:26:29 05/31/2024
-- Design Name:   
-- Module Name:   C:/Users/DANIEL/Desktop/SD/ULA_FINAL/TB_SOMAR4BITS.vhd
-- Project Name:  ULA_FINAL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OPERACAO_SOMAR4BITS
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
 
ENTITY TB_SOMAR4BITS IS
END TB_SOMAR4BITS;
 
ARCHITECTURE behavior OF TB_SOMAR4BITS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OPERACAO_SOMAR4BITS
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         CARRY_IN : IN  std_logic;
         Z : OUT  std_logic_vector(3 downto 0);
         CARRY_OUT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal CARRY_IN : std_logic := '0';

 	--Outputs
   signal Z : std_logic_vector(3 downto 0);
   signal CARRY_OUT : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OPERACAO_SOMAR4BITS PORT MAP (
          A => A,
          B => B,
          CARRY_IN => CARRY_IN,
          Z => Z,
          CARRY_OUT => CARRY_OUT
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		A <= "0101";
		B <= "0001";
      wait for 100 ns;	
      -- insert stimulus here 

      wait;
   end process;

END;
