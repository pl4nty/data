-- Threat: !InfrastructureShared
-- Name: 49781cda8f4a
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 458752 <= l_0_0 and l_0_0 <= 491520 then
  return mp.INFECTED
end
return mp.CLEAN
