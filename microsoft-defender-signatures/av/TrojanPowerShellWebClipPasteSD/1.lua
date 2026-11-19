-- Threat: Trojan:PowerShell/WebClipPaste.SD
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: ((MpIsPowerShellAMSIScan & MpPowershellAmsiViaCmdLine) | MpIsWindowsTerminalAMSI)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 200 or 8192 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
mp.readprotection(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 200 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
if string.find(string.sub(l_0_3, 1, 64), string.char(0), 1, true) then
  local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
  if l_0_4 and type(l_0_5) == "string" and 0 < #l_0_5 then
    l_0_3 = l_0_5
  end
end
if #l_0_3 < 200 or 8192 < #l_0_3 then
  return mp.CLEAN
end
local l_0_6 = string.lower((string.gsub(l_0_3, "[%^`]", "")))
if not string.find(l_0_6, "webclient", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_6, "downloadstring(", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_6, "codedom.compiler", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_6, "compileassemblyfromsource", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_6, "process.start", 1, true) then
  return mp.CLEAN
end
local l_0_7 = {
  "IsClickFixCMD",
  "IsClickFixCMD_Malicious"
}
local l_0_8, l_0_9, l_0_10, l_0_11, l_0_12 = FindRollingQueueContentMatch(l_0_7, l_0_3)
if not l_0_8 then
  return mp.CLEAN
end
local l_0_13 = tostring(l_0_12) .. "||" .. tostring(l_0_9) .. "||" .. string.sub(tostring(l_0_11 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_10), 1, 320) .. "||" .. string.sub(tostring(l_0_3), 1, 320)
set_research_data("CompiledRemoteLoader_A", l_0_13, false)
return mp.INFECTED
