-- Threat: !InfrastructureShared
-- Name: 75405d2675d7
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and peattributes.ismsil == true and 4096 <= l_0_0 and l_0_0 <= 12288 then
  return mp.INFECTED
end
return mp.CLEAN
