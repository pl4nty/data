-- Threat: !InfrastructureShared
-- Name: 93617d413ee6
-- Type: 21

local l_0_0 = pehdr.TimeDateStamp
if l_0_0 == 0 then
  return mp.INFECTED
end
return mp.CLEAN
