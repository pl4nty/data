-- Threat: !InfrastructureShared
-- Name: 3178e6887329
-- Type: 21

if mp.getfilesize() < 380000 then
  return mp.LOWFI
end
return mp.CLEAN
