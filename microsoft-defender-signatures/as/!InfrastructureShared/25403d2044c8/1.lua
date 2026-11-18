-- Threat: !InfrastructureShared
-- Name: 25403d2044c8
-- Type: 21

if mp.getfilesize() > 40000 then
  return mp.CLEAN
end
return mp.LOWFI
