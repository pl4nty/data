-- Threat: !InfrastructureShared
-- Name: 2244180a64ebc
-- Type: 21

if mp.getfilesize() <= 2048 then
  return mp.INFECTED
end
return mp.CLEAN
