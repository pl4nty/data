-- Threat: Trojan:PowerShell/WebClipPaste.D
-- Type: 13
-- Includes: LuaFuncHelper, ResearchData
-- MpAttributes: (MpPowershellAmsiViaCmdLine | MpIsWindowsTerminalAMSI)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 16 or 16384 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1, l_0_2 = pcall(mp.readfile, 0, l_0_0)
mp.readprotection(true)
if not l_0_1 or type(l_0_2) ~= "string" or #l_0_2 ~= l_0_0 then
  return mp.CLEAN
end
local l_0_3 = l_0_2
if string.find(string.sub(l_0_3, 1, 64), string.char(0), 1, true) then
  local l_0_4, l_0_5 = pcall(mp.utf16to8, l_0_3)
  if not l_0_4 or type(l_0_5) ~= "string" then
    return mp.CLEAN
  end
  l_0_3 = l_0_5
end
if #l_0_3 < 24 or 8192 < #l_0_3 then
  return mp.CLEAN
end
local l_0_6 = {
  monster = true,
  cfd = true,
  top = true,
  club = true,
  online = true,
  boats = true,
  cc = true,
  hair = true,
  lol = true,
  sbs = true,
  shop = true,
  buzz = true,
  mom = true,
  stream = true,
  courses = true,
  charity = true,
  bet = true,
  homes = true,
  uno = true,
  garden = true,
  beauty = true,
  zip = true,
  skin = true,
  bar = true,
  fit = true,
  coupons = true,
  date = true,
  pics = true,
  help = true,
  rocks = true,
  wtf = true,
  zw = true
}

local function l_0_7(l_1_0, l_1_1)
  if type(l_1_1) ~= "string" then
    return false
  end
  local l_1_2 = string.match(string.lower(l_1_1), "^https?://[%w%.%-]+%.([a-z]+)/%?")
  return l_1_2 ~= nil and l_0_6[l_1_2] == true
end

local l_0_8 = {
  minCandidateLength = 24,
  minKeyLength = 24,
  maxKeyLength = 8192,
  keyInCandidateMinLength = 24,
  candidateInKeyMinLength = 100,
  distinctiveMinLength = 40,
  distinctiveBlobMinLength = 64,
  entryFilter = l_0_7
}
local l_0_9, l_0_10, l_0_11, l_0_12, l_0_13 = FindRollingQueueContentMatch({
  "IsClickFixCMD_Malicious"
}, l_0_3, l_0_8)
if not l_0_9 or not l_0_7(l_0_11, l_0_12) then
  return mp.CLEAN
end
local l_0_14
local l_0_15, l_0_16 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if l_0_15 and type(l_0_16) == "string" then
  l_0_14 = l_0_16
end
local l_0_17 = tostring(l_0_13) .. "||" .. tostring(l_0_10) .. "||" .. string.sub(tostring(l_0_14 or "-"), 1, 128) .. "||" .. string.sub(tostring(l_0_12), 1, 128) .. "||" .. string.sub(tostring(l_0_11), 1, 320) .. "||" .. string.sub(l_0_3, 1, 320)
set_research_data("WebClipPaste_D", l_0_17, false)
return mp.INFECTED
