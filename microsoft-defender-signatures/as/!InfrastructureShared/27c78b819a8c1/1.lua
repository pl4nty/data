-- Threat: !InfrastructureShared
-- Name: 27c78b819a8c1
-- Type: 21

if mp.getfilesize() < 2044000 and pehdr.NumberOfSections <= 5 then
  return mp.INFECTED
end
return mp.CLEAN
