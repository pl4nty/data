-- Threat: !InfrastructureShared
-- Name: ad8caeea7303
-- Type: 21

local l_0_0 = mp.getfilesize()
if 3145728 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
