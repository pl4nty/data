-- Threat: !InfrastructureShared
-- Name: 387864576d00
-- Type: 21

if mp.getfilesize() > 51200 then
  return mp.CLEAN
end
return mp.INFECTED
