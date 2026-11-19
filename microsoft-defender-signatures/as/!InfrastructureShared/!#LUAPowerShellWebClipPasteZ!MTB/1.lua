-- Threat: !InfrastructureShared
-- Name: !#LUA:PowerShell/WebClipPaste.Z!MTB
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: scrpt:powershell/msiexe.exe & (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

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
local l_0_8 = string.sub(l_0_6, 1, 4) == "iex(" or string.sub(l_0_6, 1, 5) == "iex (" or string.sub(l_0_6, 1, 18) == "invoke-expression(" or string.sub(l_0_6, 1, 19) == "invoke-expression ("
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = string.find(l_0_6, "iwr ", 1, true) or string.find(l_0_6, "iwr(", 1, true) or string.find(l_0_6, "invoke-webrequest ", 1, true) or string.find(l_0_6, "invoke-webrequest(", 1, true)
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = "-usebasicparsing)"
if #l_0_6 < #l_0_10 or string.sub(l_0_6, -#l_0_10) ~= l_0_10 then
  return mp.CLEAN
end
local l_0_11 = {
  "IsClickFixCMD",
  "IsClickFixCMD_Malicious"
}
local l_0_12, l_0_13, l_0_14, l_0_15, l_0_16 = FindRollingQueueContentMatch(l_0_11, l_0_3)
if not l_0_12 then
  return mp.CLEAN
end
local l_0_17 = "iex_iwr_usebasicparsing" .. "||" .. tostring(l_0_16 or "-") .. "||" .. tostring(l_0_13 or "-") .. "||" .. string.sub(tostring(l_0_15 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_14 or "-"), 1, 320) .. "||" .. string.sub(tostring(l_0_3), 1, 320)
set_research_data("WebClipPaste_SB", l_0_17, false)
return mp.INFECTED
