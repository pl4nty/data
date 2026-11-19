-- Threat: !InfrastructureShared
-- Name: 8540672a9fcf
-- Type: 21

local l_0_0 = mp.getfilesize()
if 147456 <= l_0_0 and l_0_0 <= 184320 or 217088 <= l_0_0 and l_0_0 <= 262144 or 131072 <= l_0_0 and l_0_0 <= 135168 then
  return mp.INFECTED
end
return mp.LOWFI
