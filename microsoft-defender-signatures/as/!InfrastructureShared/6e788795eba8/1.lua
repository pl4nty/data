-- Threat: !InfrastructureShared
-- Name: 6e788795eba8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 2359296 <= l_0_0 and l_0_0 <= 2555904 and pehdr.NumberOfSections >= 4 and pehdr.NumberOfSections <= 6 then
  return mp.INFECTED
end
return mp.CLEAN
