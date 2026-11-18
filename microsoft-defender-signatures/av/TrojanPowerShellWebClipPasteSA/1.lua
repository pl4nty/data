-- Threat: Trojan:PowerShell/WebClipPaste.SA
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

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
local l_0_7 = 0
local l_0_8 = {
  "cloudflare",
  "security verification",
  "checking browser integrity",
  "starting cloudflare verification",
  "cloudflare services respond",
  "cloudflare verification failed",
  "verification completed",
  "verification finished",
  "verification successful",
  "i am not a robot"
}
for l_0_9, l_0_10 in ipairs(l_0_8) do
  if string.find(l_0_6, l_0_10, 1, true) then
    l_0_7 = l_0_7 + 1
  end
end
if l_0_7 < 2 then
  return mp.CLEAN
end
local l_0_11 = string.find(l_0_6, "new-object net.webclient", 1, true) or string.find(l_0_6, "new-object system.net.webclient", 1, true)
if not l_0_11 or not string.find(l_0_6, ".downloadfile(", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_6, "expand-archive", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_6, ".zip", 1, true) then
  return mp.CLEAN
end
if not string.find(l_0_6, ".bat", 1, true) then
  return mp.CLEAN
end
local l_0_12 = string.find(l_0_6, "cmd /c", 1, true) or string.find(l_0_6, "; & ", 1, true) or string.find(l_0_6, [[

& ]], 1, true)
if not l_0_12 then
  return mp.CLEAN
end
local l_0_13 = {
  "IsClickFixCMD",
  "IsClickFixCMD_Malicious"
}
local l_0_14, l_0_15, l_0_16, l_0_17, l_0_18 = FindRollingQueueContentMatch(l_0_13, l_0_3)
if not l_0_14 then
  return mp.CLEAN
end
local l_0_19 = tostring(l_0_18) .. "||" .. tostring(l_0_15) .. "||" .. string.sub(tostring(l_0_17 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_16), 1, 320) .. "||" .. string.sub(tostring(l_0_3), 1, 320)
set_research_data("FakeVerifyDownload_A", l_0_19, false)
return mp.INFECTED
