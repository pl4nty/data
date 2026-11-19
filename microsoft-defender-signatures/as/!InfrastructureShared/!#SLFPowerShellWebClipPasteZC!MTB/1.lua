-- Threat: !InfrastructureShared
-- Name: !#SLF:PowerShell/WebClipPaste.ZC!MTB
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: SCRIPT:BlockCreate.A & (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

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
local l_0_6 = string.lower((string.gsub(l_0_3, "[%^`]", "")))
l_0_6 = string.gsub(l_0_6, "^[%s%z]+", "")
l_0_6 = string.gsub(l_0_6, "[%s%z]+$", "")
l_0_6 = string.gsub(l_0_6, "[%s%z]+$", "")
l_0_6 = string.gsub(l_0_6, "[^%w]", "")
local l_0_7 = string.find(l_0_6, ".md", 1, true)
if l_0_7 then
  return mp.CLEAN
end
local l_0_8 = string.find(l_0_6, "iwr", 1, true) or string.find(l_0_6, "iex", 1, true) or string.find(l_0_6, "invoke-webrequest ", 1, true) or string.find(l_0_6, "invoke-expression", 1, true) or string.find(l_0_6, "irm ", 1, true) or string.find(l_0_6, "invoke-restmethod", 1, true) or string.find(l_0_6, "invoke-restmethod", 1, true) or string.find(l_0_6, "char", 1, true) or string.find(l_0_6, "net.webclient", 1, true) or string.find(l_0_6, "download", 1, true)
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = {
  "IsClickFixCMD",
  "IsClickFixCMD_Malicious"
}
local l_0_10 = FindRollingQueueContentMatch(l_0_9, l_0_3)
if not l_0_10 then
  return mp.CLEAN
end
return mp.INFECTED
