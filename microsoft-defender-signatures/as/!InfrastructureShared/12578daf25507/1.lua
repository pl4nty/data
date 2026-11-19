-- Threat: !InfrastructureShared
-- Name: 12578daf25507
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 and mp.getfilesize() == 86016 then
  return mp.INFECTED
end
return mp.CLEAN
