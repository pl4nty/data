-- Threat: !InfrastructureShared
-- Name: ee419310eb77
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
