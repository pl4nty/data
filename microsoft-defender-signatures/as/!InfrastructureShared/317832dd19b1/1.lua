-- Threat: !InfrastructureShared
-- Name: 317832dd19b1
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
