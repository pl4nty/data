-- Threat: !InfrastructureShared
-- Name: e6780de18c91
-- Type: 21

if mp.getfilesize() < 1024000 and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
