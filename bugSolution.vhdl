```vhdl
ENTITY good_process IS
  PORT (clk : IN  STD_LOGIC;
        reset : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;

ARCHITECTURE behavioral OF good_process IS
  SIGNAL internal_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      internal_data <= "00000000";
      data_out <= "00000000"; -- added this line to solve the problem
    ELSIF rising_edge(clk) THEN
      internal_data <= data_in;
    END IF;
  END PROCESS;
  data_out <= internal_data; -- Asynchronous assignment outside of the process
END ARCHITECTURE;
```