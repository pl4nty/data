-- Threat: !InfrastructureShared
-- Name: 637831026269
-- Type: 21

if peattributes.isexe and pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections <= 6 and mp.getfilesize() >= 65536 and mp.getfilesize() <= 3145728 then
  return mp.INFECTED
end
return mp.CLEAN
