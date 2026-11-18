-- Threat: !InfrastructureShared
-- Name: 4d78c173909c
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 197000 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
