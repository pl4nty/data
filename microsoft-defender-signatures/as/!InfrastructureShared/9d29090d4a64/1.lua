-- Threat: !InfrastructureShared
-- Name: 9d29090d4a64
-- Type: 21

local l_0_0 = mp.getfilesize()
if 3145728 <= l_0_0 then
  return mp.INFECTED
end
return mp.LOWFI
