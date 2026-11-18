-- Threat: !InfrastructureShared
-- Name: 21678458283ca
-- Type: 21

local l_0_0 = 0
if 0 < mp.bitand(mp.HSTR_WEIGHT, 240) then
  l_0_0 = 2
end
if mp.bitand(mp.HSTR_WEIGHT, 15) + l_0_0 >= 4 then
  if pehdr.Machine ~= 332 then
    mp.changedetectionname(805306465)
  end
  return mp.INFECTED
end
return mp.CLEAN
