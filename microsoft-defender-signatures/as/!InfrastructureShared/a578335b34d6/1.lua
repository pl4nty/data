-- Threat: !InfrastructureShared
-- Name: a578335b34d6
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 151552 <= l_0_0 and l_0_0 <= 155648 and pehdr.NumberOfSections >= 7 and pehdr.NumberOfSections <= 9 then
  return mp.INFECTED
end
return mp.CLEAN
