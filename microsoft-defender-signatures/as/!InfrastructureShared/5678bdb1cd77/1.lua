-- Threat: !InfrastructureShared
-- Name: 5678bdb1cd77
-- Type: 21

if mp.getfilesize() < 400000 then
  return mp.INFECTED
end
return mp.CLEAN
