-- Threat: !InfrastructureShared
-- Name: 4878d7a799d9
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
