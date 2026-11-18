-- Threat: !InfrastructureShared
-- Name: af29319cf612
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 6000 and 4000 < l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
