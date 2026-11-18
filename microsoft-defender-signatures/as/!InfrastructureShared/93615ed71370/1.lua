-- Threat: !InfrastructureShared
-- Name: 93615ed71370
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security and peattributes.ismsil == true and 524288 < l_0_0 and l_0_0 < 851968 then
  return mp.INFECTED
end
return mp.CLEAN
