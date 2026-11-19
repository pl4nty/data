-- Threat: !InfrastructureShared
-- Name: 8761305e3344
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and peattributes.ismsil == true and 655360 < l_0_0 and l_0_0 < 720896 then
  return mp.INFECTED
end
return mp.CLEAN
