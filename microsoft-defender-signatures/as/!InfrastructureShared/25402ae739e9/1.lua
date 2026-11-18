-- Threat: !InfrastructureShared
-- Name: 25402ae739e9
-- Type: 21

if mp.getfilesize() > 100000 then
  return mp.CLEAN
end
return mp.LOWFI
