-- Threat: !InfrastructureShared
-- Name: f68f8315330c
-- Type: 21

if mp.getfilesize() < 150000 then
  return mp.INFECTED
end
return mp.CLEAN
