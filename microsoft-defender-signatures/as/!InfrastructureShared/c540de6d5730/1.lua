-- Threat: !InfrastructureShared
-- Name: c540de6d5730
-- Type: 21

if mp.getfilesize() < 4000000 then
  return mp.LOWFI
end
return mp.CLEAN
