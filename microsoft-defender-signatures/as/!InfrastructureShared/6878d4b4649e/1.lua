-- Threat: !InfrastructureShared
-- Name: 6878d4b4649e
-- Type: 21

if peattributes.isexe and pehdr.NumberOfSections >= 3 and pehdr.NumberOfSections <= 7 and mp.getfilesize() >= 65536 and mp.getfilesize() <= 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
