-- Threat: !InfrastructureShared
-- Name: 4b78cee6c3b6
-- Type: 21

if mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
