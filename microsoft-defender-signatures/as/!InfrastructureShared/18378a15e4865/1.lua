-- Threat: !InfrastructureShared
-- Name: 18378a15e4865
-- Type: 21

if pehdr.NumberOfSections == 3 and mp.getfilesize() < 1064000 then
  return mp.INFECTED
end
return mp.CLEAN
