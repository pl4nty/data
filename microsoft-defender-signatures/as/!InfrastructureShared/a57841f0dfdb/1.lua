-- Threat: !InfrastructureShared
-- Name: a57841f0dfdb
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 458752 <= l_0_0 and l_0_0 <= 1044480 and pehdr.NumberOfSections >= 6 and pehdr.NumberOfSections <= 9 then
  return mp.INFECTED
end
return mp.CLEAN
