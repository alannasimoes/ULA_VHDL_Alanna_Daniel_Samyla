LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

---------------------------------------------
------------------ENTIDADE-------------------
---------------------------------------------
ENTITY OPERACAO_SUBTRAIR4BITS IS
    PORT (
        A : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        Z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        CARRY_OUT : OUT STD_LOGIC;
        FLAG_RESULTADO_NEGATIVO : OUT STD_LOGIC  -- Flag para indicar resultado negativo
    );
END OPERACAO_SUBTRAIR4BITS;

---------------------------------------------
-----------------ARQUITETURA-----------------
---------------------------------------------
ARCHITECTURE BEHAVIORAL OF OPERACAO_SUBTRAIR4BITS IS
    ---------------------------------------------
    -----------------COMPONENTE------------------
    ---------------------------------------------    
    COMPONENT OPERACAO_NOT IS
        PORT (
            A : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            Z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    ---------------------------------------------
    -----------------COMPONENTE------------------
    ---------------------------------------------    
    COMPONENT OPERACAO_SOMAR4BITS IS
        PORT (
            A, B : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
            CARRY_IN : IN  STD_LOGIC;
            Z : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            CARRY_OUT : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL B_INVERTIDO : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL TEMP_RESULT : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL TEMP_CARRY_OUT : STD_LOGIC;

BEGIN

    -- INVERTER OS BITS DE B
    INVERTER: OPERACAO_NOT PORT MAP(
        A => B,
        Z => B_INVERTIDO
    );

    -- SOMAR A COM O COMPLEMENTO DE DOIS DE B (B_INVERTIDO + 1)
    SOMADOR: OPERACAO_SOMAR4BITS PORT MAP(
        A => A,
        B => B_INVERTIDO,
        CARRY_IN => '1',  -- ADICIONAR 1 AO COMPLEMENTO DE DOIS
        Z => TEMP_RESULT,
        CARRY_OUT => TEMP_CARRY_OUT
    );

    -- ATRIBUIR O RESULTADO FINAL
    Z <= TEMP_RESULT;
    CARRY_OUT <= TEMP_CARRY_OUT;

    -- DEFINIR FLAG DE RESULTADO NEGATIVO
    FLAG_RESULTADO_NEGATIVO <= TEMP_RESULT(3);  -- MSB do resultado indica sinal negativo

END BEHAVIORAL;
