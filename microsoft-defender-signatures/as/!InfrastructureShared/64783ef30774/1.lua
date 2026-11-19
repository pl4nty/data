-- Threat: !InfrastructureShared
-- Name: 64783ef30774
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 4000000 or 8000000 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
