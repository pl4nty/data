-- Threat: !InfrastructureShared
-- Name: 4861d5674dda
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and peattributes.no_security == true and l_0_0 <= 8192 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
