-- Threat: !InfrastructureShared
-- Name: be7889ac4f5d
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.no_security and 589824 < l_0_0 and l_0_0 < 655360 then
  return mp.INFECTED
end
return mp.CLEAN
