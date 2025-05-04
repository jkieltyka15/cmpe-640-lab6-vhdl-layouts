-- Entity: positive level triggered D latch
-- Architecture : structural
-- Author: 
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY Dlatch IS
    PORT (
        d : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        q : OUT STD_LOGIC;
        qbar : OUT STD_LOGIC);
END Dlatch;

ARCHITECTURE structural OF Dlatch IS

BEGIN

    output : PROCESS (d, clk)

    BEGIN
        IF clk = '1' THEN
            q <= d;
            qbar <= NOT d;
        END IF;
    END PROCESS output;

END structural;