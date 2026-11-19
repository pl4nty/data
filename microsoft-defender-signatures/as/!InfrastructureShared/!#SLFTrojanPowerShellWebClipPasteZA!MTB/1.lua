-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/WebClipPaste.ZA!MTB
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: (SCRIPT:PowerShell/IexIwr.A | SCRIPT:PowerShell/IrmIwr.A) & (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 64 or 8192 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
mp.readprotection(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 64 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
if string.find(string.sub(l_0_3, 1, 64), string.char(0), 1, true) then
  local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
  if l_0_4 and type(l_0_5) == "string" and 0 < #l_0_5 then
    l_0_3 = l_0_5
  end
end
if #l_0_3 < 64 or 8192 < #l_0_3 then
  return mp.CLEAN
end
local l_0_6 = {
  "IsClickFixCMD",
  "IsClickFixCMD_Malicious"
}
local l_0_7 = FindRollingQueueContentMatch(l_0_6, l_0_3)
if not l_0_7 then
  return mp.CLEAN
end
return mp.INFECTED
