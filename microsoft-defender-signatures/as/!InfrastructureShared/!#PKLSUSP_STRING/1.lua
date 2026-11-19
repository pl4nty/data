-- Threat: !InfrastructureShared
-- Name: !#//PKL:SUSP_STRING
-- Type: 13
-- MpAttributes: MpIsPKLStringScan

local l_0_0 = {
  ["SCPT:Py_SocketCall1"] = 1,
  ["SCRIPT:Python/Revshot.A1"] = 1,
  ["SCPT:PYScript_ReverseShell"] = 1,
  ["SCPT:PYScript_recv"] = 1,
  ["SCPT:ReverseShell!R2"] = 1,
  ["SCPT:PYScript_connect"] = 1,
  ["SCPT:PYScript_subprocess_call"] = 1,
  ["SCPT:PYScript_subprocess_check_output"] = 1,
  ["SCPT:PYScript_sendall"] = 1,
  ["SCPT:PYScript_shell_true"] = 1,
  ["SCPT:PYScript_run_shell"] = 1,
  ["SCPT:PYScript_main"] = 1,
  ["BRUTE:Powershell"] = 1,
  ["SCPT:PYScript_WebBro_Open"] = 1,
  ["SCPT:PYScript_import_sys"] = 1,
  ["SCPT:PYScript_del_sys_modules"] = 1,
  ["CMN:SH/CMD_RM"] = 1,
  ["CMN:SH/CMD_CHDIR"] = 1,
  ["SCPT:VenomousSugar.J"] = 1,
  ["SCPT:VenomousSugar.I"] = 1,
  ["SCRIPT:StringCurl"] = 1,
  ["SCPT:wget.parameter"] = 1,
  ["SCRIPT:ChmodToExec"] = 1,
  ["SCPT:PKLSuspPSString"] = 2
}
local l_0_1 = 0
for l_0_2, l_0_3 in pairs(l_0_0) do
  local l_0_4 = mp.get_mpattribute(l_0_2)
  if l_0_4 then
    l_0_1 = l_0_1 + l_0_3
    if 2 <= l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
