-- Threat: !InfrastructureShared
-- Name: 226143f708b4
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 114688 <= l_0_0 and l_0_0 <= 159744 and pehdr.NumberOfSections == 6 then
  return mp.INFECTED
end
return mp.CLEAN
