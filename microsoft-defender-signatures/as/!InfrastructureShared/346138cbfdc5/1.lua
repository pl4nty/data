-- Threat: !InfrastructureShared
-- Name: 346138cbfdc5
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and pehdr.NumberOfSections == 5 and 2138112 <= l_0_0 and l_0_0 <= 2281472 then
  return mp.INFECTED
end
return mp.CLEAN
