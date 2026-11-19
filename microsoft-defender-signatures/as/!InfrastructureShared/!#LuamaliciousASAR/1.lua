-- Threat: !InfrastructureShared
-- Name: !#Lua:maliciousASAR
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:ASARExt & BM_UNKNOWN_FILE & Brute:ASAR.Sign1 & Brute:ASAR.Sign2

local l_0_0 = mp.getfilesize()
if l_0_0 < 20971520 or 104857600 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(l_0_0 - 16384, 8192)
mp.readprotection(true)
if l_0_1 ~= nil then
  l_0_1 = tostring(l_0_1)
  if string.find(l_0_1, "js-confuser", 1, true) ~= nil or string.find(l_0_1, "javascript-obfuscator", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
