-- Threat: !InfrastructureShared
-- Name: 7178556592ea
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 114688 <= l_0_0 and l_0_0 <= 122880 and (pehdr.NumberOfSections >= 5 or pehdr.NumberOfSections <= 7) then
  return mp.INFECTED
end
return mp.CLEAN
