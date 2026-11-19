-- Threat: !InfrastructureShared
-- Name: 5189ef11df71
-- Type: 21

local l_0_0 = mp.crc32(-1, epcode, 1, 9)
if l_0_0 == 2556408724 and pevars.epsec == pehdr.NumberOfSections then
  return mp.INFECTED
else
  return mp.LOWFI
end
return mp.CLEAN
