-- Threat: !InfrastructureShared
-- Name: 9a78c8f1c33d
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 9000 then
  return mp.INFECTED
end
return mp.CLEAN
