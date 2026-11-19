-- Threat: !InfrastructureShared
-- Name: 7078a12d5683
-- Type: 21

mp.readprotection(false)
local l_0_0 = mp.readfile(534350, 1057)
if mp.crc32(-1, l_0_0, 1, 1057) == 539295301 then
  return mp.INFECTED
end
return mp.CLEAN
