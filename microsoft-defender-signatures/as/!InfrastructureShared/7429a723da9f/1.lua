-- Threat: !InfrastructureShared
-- Name: 7429a723da9f
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3000 then
  return mp.INFECTED
end
return mp.CLEAN
