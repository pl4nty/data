-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/WebClipPaste.SC
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 80 or 8192 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
mp.readprotection(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 < 80 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
if string.find(string.sub(l_0_3, 1, 64), string.char(0), 1, true) then
  local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
  if l_0_4 and type(l_0_5) == "string" and 0 < #l_0_5 then
    l_0_3 = l_0_5
  end
end
if #l_0_3 < 80 or 8192 < #l_0_3 then
  return mp.CLEAN
end
local l_0_6 = string.lower((string.gsub(l_0_3, "[%^`]", "")))
local l_0_7 = string.find(l_0_6, "iex(", 1, true) or string.find(l_0_6, "iex (", 1, true) or string.find(l_0_6, "|iex", 1, true) or string.find(l_0_6, "| iex", 1, true) or string.find(l_0_6, "invoke-expression", 1, true)
local l_0_8 = string.find(l_0_6, "irm ", 1, true) or string.find(l_0_6, "irm(", 1, true) or string.find(l_0_6, "invoke-restmethod", 1, true) or string.find(l_0_6, "iwr ", 1, true) or string.find(l_0_6, "iwr(", 1, true) or string.find(l_0_6, "invoke-webrequest", 1, true) or string.find(l_0_6, "downloadstring(", 1, true)
if not l_0_7 or not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = 0
local l_0_10 = string.find(l_0_6, "(('htt", 1, true) or string.find(l_0_6, "('htt", 1, true)
if l_0_10 then
  l_0_9 = l_0_9 + 1
end
if string.find(l_0_6, "wua/", 1, true) then
  l_0_9 = l_0_9 + 1
end
if string.find(l_0_6, "/hex/cloudflare/", 1, true) or string.find(l_0_6, "/cloudflare/", 1, true) then
  l_0_9 = l_0_9 + 1
end
if string.find(l_0_6, ".trycloudflare.com", 1, true) then
  l_0_9 = l_0_9 + 1
end
if string.find(l_0_6, "[char[]]", 1, true) then
  l_0_9 = l_0_9 + 1
end
if string.find(l_0_6, "frombase64string", 1, true) then
  l_0_9 = l_0_9 + 1
end
if string.find(l_0_6, "-bxor", 1, true) then
  l_0_9 = l_0_9 + 1
end
if l_0_9 < 2 then
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
local l_0_17 = tostring(l_0_16) .. "||" .. tostring(l_0_13) .. "||" .. string.sub(tostring(l_0_15 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_14), 1, 320) .. "||" .. string.sub(tostring(l_0_3), 1, 320)
set_research_data("ObfuscatedRemoteExec_A", l_0_17, false)
return mp.INFECTED
