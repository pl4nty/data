-- Threat: !InfrastructureShared
-- Name: 3540a4bf73f4
-- Type: 21

if mp.getfilesize() == 88064 or mp.getfilesize() == 90624 then
  return mp.INFECTED
end
return mp.CLEAN
