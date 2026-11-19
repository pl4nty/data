-- Threat: !InfrastructureShared
-- Name: 58618893ee0a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and peattributes.no_security == true and l_0_0 <= 53248 and 36864 <= l_0_0 and peattributes.isdll == true and mp.get_mpattribute("Trojan:MSIL/MalInject.A!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
