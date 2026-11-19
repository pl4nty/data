-- Threat: !InfrastructureShared
-- Name: a578e10a592c
-- Type: 21

mp.readprotection(false)
local l_0_0 = mp.readfile(80304, 832)
if mp.crc32(-1, l_0_0, 1, 832) == 2937191514 then
  return mp.INFECTED
end
return mp.CLEAN
