-- Threat: !InfrastructureShared
-- Name: 10b78592540fb
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
