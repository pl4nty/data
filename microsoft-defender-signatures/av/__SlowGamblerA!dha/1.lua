-- Threat: \x8bSlowGambler.A!dha
-- Type: 8
-- MpAttributes: pea_ismsil

local l_0_0 = mp.getfilesize()
if 300000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 == nil or l_0_1.FileDescription == nil or l_0_1.OriginalFilename == nil then
  return mp.CLEAN
end
if not l_0_1.FileDescription:find("Feed", 1, true) then
  return mp.CLEAN
end
if l_0_1.OriginalFilename ~= "Telemetry-Feed-Update.exe" then
  return mp.CLEAN
end
return mp.INFECTED
