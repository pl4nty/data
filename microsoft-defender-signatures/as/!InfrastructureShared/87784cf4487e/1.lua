-- Threat: !InfrastructureShared
-- Name: 87784cf4487e
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and peattributes.ismsil and l_0_0 <= 2031616 and 1835008 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
