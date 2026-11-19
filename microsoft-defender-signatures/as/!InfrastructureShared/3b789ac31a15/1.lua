-- Threat: !InfrastructureShared
-- Name: 3b789ac31a15
-- Type: 21

if mp.getfilesize() < 6000 then
  return mp.INFECTED
end
return mp.CLEAN
