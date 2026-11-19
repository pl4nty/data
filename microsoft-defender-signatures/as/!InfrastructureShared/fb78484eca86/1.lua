-- Threat: !InfrastructureShared
-- Name: fb78484eca86
-- Type: 21

local l_0_0 = 0
if 0 < mp.bitand(mp.HSTR_WEIGHT, 240) then
  l_0_0 = 16
end
if mp.bitand(mp.HSTR_WEIGHT, 15) + l_0_0 >= 18 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan_prepscram")
return mp.CLEAN
