-- Threat: !InfrastructureShared
-- Name: a37856dd4618
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 519168 <= l_0_0 and l_0_0 <= 589824 then
  return mp.INFECTED
end
return mp.CLEAN
