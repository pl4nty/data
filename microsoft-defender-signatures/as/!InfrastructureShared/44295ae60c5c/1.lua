-- Threat: !InfrastructureShared
-- Name: 44295ae60c5c
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 9300 then
  return mp.INFECTED
end
return mp.CLEAN
