-- Threat: !InfrastructureShared
-- Name: 53787ff32582
-- Type: 21

if mp.getfilesize() > 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
