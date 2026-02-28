local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L0_1["SCPT:Py_SocketCall1"] = 1
L0_1["SCRIPT:Python/Revshot.A1"] = 1
L0_1["SCPT:PYScript_ReverseShell"] = 1
L0_1["SCPT:PYScript_recv"] = 1
L0_1["SCPT:ReverseShell!R2"] = 1
L0_1["SCPT:PYScript_connect"] = 1
L0_1["SCPT:PYScript_subprocess_call"] = 1
L0_1["SCPT:PYScript_subprocess_check_output"] = 1
L0_1["SCPT:PYScript_sendall"] = 1
L0_1["SCPT:PYScript_shell_true"] = 1
L0_1["SCPT:PYScript_run_shell"] = 1
L0_1["SCPT:PYScript_main"] = 1
L0_1["BRUTE:Powershell"] = 1
L0_1["SCPT:PYScript_WebBro_Open"] = 1
L0_1["SCPT:PYScript_import_sys"] = 1
L0_1["SCPT:PYScript_del_sys_modules"] = 1
L0_1["CMN:SH/CMD_RM"] = 1
L0_1["CMN:SH/CMD_CHDIR"] = 1
L0_1["SCPT:VenomousSugar.J"] = 1
L0_1["SCPT:VenomousSugar.I"] = 1
L0_1["SCRIPT:StringCurl"] = 1
L0_1["SCPT:wget.parameter"] = 1
L0_1["SCRIPT:ChmodToExec"] = 1
L1_1 = 0
L2_1 = pairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L1_1 = L1_1 + L6_1
    if 2 <= L1_1 then
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
