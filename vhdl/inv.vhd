--
-- Entity: inv 
-- Architecture : structural 
-- Author: jkielty1
-- Created On: 10/22/2023
--
LIBRARY STD;
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY inv IS

    PORT (
        input : IN STD_LOGIC;
        output : OUT STD_LOGIC);
END inv;

ARCHITECTURE structural OF inv IS

BEGIN

    output <= NOT (input);

END structural;