-- Threat: !InfrastructureShared
-- Name: 61780a4e8824
-- Type: 21

if mp.getfilesize() > 400000 then
  return mp.INFECTED
end
return mp.CLEAN
