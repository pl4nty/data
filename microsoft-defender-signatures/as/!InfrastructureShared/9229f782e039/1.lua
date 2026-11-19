-- Threat: !InfrastructureShared
-- Name: 9229f782e039
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 5000 then
  return mp.INFECTED
end
return mp.CLEAN
