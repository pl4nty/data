-- Threat: !InfrastructureShared
-- Name: 180d0cd40ef06
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or 2000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
