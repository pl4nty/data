-- Threat: !InfrastructureShared
-- Name: 14b78fbaefee4
-- Type: 21

if mp.getfilesize() > 50000000 then
  return mp.INFECTED
end
return mp.CLEAN
