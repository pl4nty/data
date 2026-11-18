-- Threat: !InfrastructureShared
-- Name: 7a78c725e855
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and peattributes.no_security == true and l_0_0 < 1500000 then
  return mp.INFECTED
end
return mp.CLEAN
