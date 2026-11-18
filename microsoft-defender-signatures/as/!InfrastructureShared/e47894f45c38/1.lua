-- Threat: !InfrastructureShared
-- Name: e47894f45c38
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 732160 <= l_0_0 and l_0_0 <= 734720 then
  return mp.INFECTED
end
return mp.CLEAN
