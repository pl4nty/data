-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanDownloaderPowerShellClickFixURLRepCheck\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_mpattributesubstring)("ClickFix")
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(tostring(headerpage))
if #l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = {}
if (mp.get_mpattribute)("Lua:TerminalFixPSState") then
  l_0_2.SIG_CONTEXT = "LuaGeneric"
  l_0_2.CONTENT_SOURCE = "AMSI_PS"
  l_0_2.PROCESS_CONTEXT = "powershell.exe"
  l_0_2.FILELESS = "true"
  l_0_2.CMDLINE_URL = "true"
end
if (mp.get_mpattribute)("MpCmdLineScan") then
  l_0_2.SIG_CONTEXT = "LuaGeneric"
  l_0_2.CONTENT_SOURCE = "CmdLineScan"
  l_0_2.PROCESS_CONTEXT = "ClickFixCmdLine"
  l_0_2.FILELESS = "true"
  l_0_2.CMDLINE_URL = "true"
end
if ExtractUrlGetReputation(l_0_1, l_0_2, true, 2, 60, false, 3000) then
  return mp.INFECTED
end
return mp.CLEAN

