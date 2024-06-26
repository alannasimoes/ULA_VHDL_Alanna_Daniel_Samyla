library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
entity OPERACAO_COMPARADOR_4BITS is
    Port (
        A : in  STD_LOGIC_VECTOR(3 downto 0);
        B : in  STD_LOGIC_VECTOR(3 downto 0);
        Z : out STD_LOGIC_VECTOR(3 downto 0)
    );
end OPERACAO_COMPARADOR_4BITS;
---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
architecture Behavioral of OPERACAO_COMPARADOR_4BITS is
begin
    process(A, B)
    begin
        if A > B then
            Z <= "0100";  -- A > B
        elsif A = B then
            Z <= "0010";  -- A = B
        else
            Z <= "0001";  -- A < B
        end if;
    end process;
end Behavioral;
