-- Threat: !InfrastructureShared
-- Name: 2a782677add2
-- Type: 21

if peattributes.isdll == true and pehdr.NumberOfSections == 2 and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
