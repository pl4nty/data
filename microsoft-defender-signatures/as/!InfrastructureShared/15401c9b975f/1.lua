-- Threat: !InfrastructureShared
-- Name: 15401c9b975f
-- Type: 21

if mp.getfilesize() < 2800000 then
  return mp.LOWFI
end
return mp.CLEAN
