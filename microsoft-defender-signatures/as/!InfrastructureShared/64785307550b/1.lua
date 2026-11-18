-- Threat: !InfrastructureShared
-- Name: 64785307550b
-- Type: 21

if mp.getfilesize() <= 184320 and mp.getfilesize() >= 8192 then
  return mp.INFECTED
end
return mp.CLEAN
