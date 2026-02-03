-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#PKLSUSP_STRING\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
l_0_0["SCPT:Py_SocketCall1"] = 1
l_0_0["SCRIPT:Python/Revshot.A1"] = 1
l_0_0["SCPT:PYScript_ReverseShell"] = 1
l_0_0["SCPT:PYScript_recv"] = 1
l_0_0["SCPT:ReverseShell!R2"] = 1
l_0_0["SCPT:PYScript_connect"] = 1
l_0_0["SCPT:PYScript_subprocess_call"] = 1
l_0_0["SCPT:PYScript_subprocess_check_output"] = 1
l_0_0["SCPT:PYScript_sendall"] = 1
l_0_0["SCPT:PYScript_shell_true"] = 1
l_0_0["SCPT:PYScript_run_shell"] = 1
l_0_0["SCPT:PYScript_main"] = 1
l_0_0["BRUTE:Powershell"] = 1
l_0_0["SCPT:PYScript_WebBro_Open"] = 1
l_0_0["SCPT:PYScript_import_sys"] = 1
l_0_0["SCPT:PYScript_del_sys_modules"] = 1
l_0_0["CMN:SH/CMD_RM"] = 1
l_0_0["CMN:SH/CMD_CHDIR"] = 1
l_0_0["SCPT:VenomousSugar.J"] = 1
l_0_0["SCPT:VenomousSugar.I"] = 1
l_0_0["SCRIPT:StringCurl"] = 1
l_0_0["SCPT:wget.parameter"] = 1
l_0_0["SCRIPT:ChmodToExec"] = 1
local l_0_1 = 0
for l_0_5,l_0_6 in pairs(l_0_0) do
  if (mp.get_mpattribute)(l_0_5) then
    l_0_1 = l_0_1 + l_0_6
    if l_0_1 >= 2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

