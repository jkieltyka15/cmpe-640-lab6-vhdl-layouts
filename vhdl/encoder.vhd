--
-- Entity: encoder
-- Architecture : structural
-- Author: jkielty1
-- Created On: 10/22/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY encoder IS

    PORT (
        e : IN STD_LOGIC;
        a0 : IN STD_LOGIC;
        a1 : IN STD_LOGIC;
        y0 : OUT STD_LOGIC;
        y1 : OUT STD_LOGIC;
        y2 : OUT STD_LOGIC;
        y3 : OUT STD_LOGIC);
END encoder;

ARCHITECTURE structural OF encoder IS

    COMPONENT inv
        PORT (
            input : IN STD_LOGIC;
            output : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT and3
        PORT (
            a : IN STD_LOGIC;
            b : IN STD_LOGIC;
            c : IN STD_LOGIC;
            output : OUT STD_LOGIC);
    END COMPONENT;

    FOR inv_0, inv_1 : inv USE ENTITY work.inv(structural);
    FOR and3_0, and3_1, and3_2, and3_3 : and3 USE ENTITY work.and3(structural);

    SIGNAL a0_bar : STD_LOGIC;
    SIGNAL a1_bar : STD_LOGIC;

BEGIN

inv_0 : inv PORT MAP(a0, a0_bar);
inv_1 : inv PORT MAP(a1, a1_bar);

and3_0 : and3 PORT MAP(e, a0_bar, a1_bar, y0);
and3_1 : and3 PORT MAP(e, a0, a1_bar, y1);
and3_2 : and3 PORT MAP(e, a0_bar, a1, y2);
and3_3 : and3 PORT MAP(e, a0, a1, y3);

END structural;