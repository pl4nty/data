-- Threat: !InfrastructureShared
-- Name: 269576806908
-- Type: 21

local l_0_0 = mp.crc32(-1, epcode, 1, 16)
if l_0_0 == 3504257948 then
  return mp.INFECTED
end
return mp.CLEAN
