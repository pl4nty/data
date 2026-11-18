-- Threat: !InfrastructureShared
-- Name: 254068a7854f
-- Type: 21

if mp.getfilesize() > 1000000 then
  return mp.CLEAN
end
return mp.LOWFI
