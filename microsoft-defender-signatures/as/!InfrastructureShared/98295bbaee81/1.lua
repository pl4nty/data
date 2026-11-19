-- Threat: !InfrastructureShared
-- Name: 98295bbaee81
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 3000 then
  return mp.INFECTED
end
return mp.CLEAN
