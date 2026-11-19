-- Threat: !InfrastructureShared
-- Name: b7781168fac9
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 120000 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
