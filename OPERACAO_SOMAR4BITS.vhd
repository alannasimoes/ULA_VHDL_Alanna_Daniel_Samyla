LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
ENTITY OPERACAO_SOMAR4BITS IS
    PORT (
        A, B                : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        CARRY_IN            : IN  STD_LOGIC;
        Z                   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        CARRY_OUT           : OUT STD_LOGIC;
        FLAG_RESULTADO_NULO : OUT STD_LOGIC;
        FLAG_OVERFLOW       : OUT STD_LOGIC
    );
END OPERACAO_SOMAR4BITS;

---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
ARCHITECTURE BEHAVIORAL OF OPERACAO_SOMAR4BITS IS
    ---------------------------------------------
    -----------------COMPONENTE------------------
    ---------------------------------------------
    COMPONENT OPERACAO_SOMAR1BIT IS
        PORT (
            A, B, CARRY_IN : IN  STD_LOGIC;
            Z, CARRY_OUT   : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL CARRY        : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL SUM          : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL TEMP_CARRY   : STD_LOGIC;
	 SIGNAL TEMP_XOR		: STD_LOGIC;

BEGIN
    -- INSTANCIANDO QUATRO SOMADORES DE 1 BIT
    SOMADOR0: OPERACAO_SOMAR1BIT PORT MAP(A(0), B(0), CARRY_IN, SUM(0), CARRY(0));
    SOMADOR1: OPERACAO_SOMAR1BIT PORT MAP(A(1), B(1), CARRY(0), SUM(1), CARRY(1));
    SOMADOR2: OPERACAO_SOMAR1BIT PORT MAP(A(2), B(2), CARRY(1), SUM(2), CARRY(2));
    SOMADOR3: OPERACAO_SOMAR1BIT PORT MAP(A(3), B(3), CARRY(2), SUM(3), TEMP_CARRY);  -- Temporrio para calcular overflow
    -- SADA DO SOMADOR DE 4 BITS
    Z <= SUM;

    -- Deteco de Overflow
	 FLAG_OVERFLOW <= TEMP_CARRY;
	 CARRY_OUT <= TEMP_CARRY;
    -- Deteco de Resultado Nulo
    FLAG_RESULTADO_NULO <= '1' WHEN (SUM = "0000") ELSE '0';  -- Resultado  nulo quando a soma resulta em "0000"
END BEHAVIORAL;


