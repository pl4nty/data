-- Threat: !InfrastructureShared
-- Name: 25401dc711c1
-- Type: 21

if mp.getfilesize() > 1000000 then
  return mp.CLEAN
end
return mp.LOWFI
