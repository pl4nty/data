-- Threat: !InfrastructureShared
-- Name: 34292de0b94e
-- Type: 21

local l_0_0 = mp.getfilesize()
if 200 <= l_0_0 then
  return mp.CLEAN
end
return mp.LOWFI
