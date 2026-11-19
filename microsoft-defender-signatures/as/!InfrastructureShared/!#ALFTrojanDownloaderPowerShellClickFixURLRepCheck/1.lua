-- Threat: !InfrastructureShared
-- Name: !#ALF:TrojanDownloader:PowerShell/ClickFix.URLRepCheck
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: Lua:TerminalFixPSState | MpCmdLineScan

local l_0_0 = mp.get_mpattributesubstring("ClickFix")
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(tostring(headerpage))
if #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = {}
if mp.get_mpattribute("Lua:TerminalFixPSState") then
  l_0_2.SIG_CONTEXT = "LuaGeneric"
  l_0_2.CONTENT_SOURCE = "AMSI_PS"
  l_0_2.PROCESS_CONTEXT = "powershell.exe"
  l_0_2.FILELESS = "true"
  l_0_2.CMDLINE_URL = "true"
end
if mp.get_mpattribute("MpCmdLineScan") then
  l_0_2.SIG_CONTEXT = "LuaGeneric"
  l_0_2.CONTENT_SOURCE = "CmdLineScan"
  l_0_2.PROCESS_CONTEXT = "ClickFixCmdLine"
  l_0_2.FILELESS = "true"
  l_0_2.CMDLINE_URL = "true"
end
local l_0_3, l_0_4 = ExtractUrlGetReputation(l_0_1, l_0_2, true, 2, 60, false, 3000)
if l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
