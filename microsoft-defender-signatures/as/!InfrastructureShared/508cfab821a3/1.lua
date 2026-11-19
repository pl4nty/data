-- Threat: !InfrastructureShared
-- Name: 508cfab821a3
-- Type: 21

if mp.getfilesize() > 8192 then
  return mp.CLEAN
end
return mp.INFECTED
