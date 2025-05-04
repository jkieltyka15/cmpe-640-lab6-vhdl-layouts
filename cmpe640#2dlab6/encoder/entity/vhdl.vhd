-- Created by @(#)$CDS: vhdlin version 6.1.8-64b 06/22/2022 16:17 (sjfhw317) $
-- on Mon Oct 23 20:18:48 2023


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
