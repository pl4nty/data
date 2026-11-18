-- Threat: !InfrastructureShared
-- Name: 100614c486fb7
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 548864 <= l_0_0 and l_0_0 <= 585728 then
  return mp.INFECTED
end
return mp.CLEAN
