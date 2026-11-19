-- Threat: !InfrastructureShared
-- Name: 4878c14b2118
-- Type: 21

if mp.getfilesize() < 350000 then
  return mp.LOWFI
end
return mp.CLEAN
