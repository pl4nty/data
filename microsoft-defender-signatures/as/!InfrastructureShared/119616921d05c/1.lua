-- Threat: !InfrastructureShared
-- Name: 119616921d05c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and peattributes.no_security == true and l_0_0 <= 983040 and 393216 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
