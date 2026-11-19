-- Threat: !InfrastructureShared
-- Name: 2f7842032498
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.LOWFI
end
return mp.CLEAN
