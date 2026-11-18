-- Threat: !InfrastructureShared
-- Name: 8378075f1588
-- Type: 21

if peattributes.no_security and mp.getfilesize() > 155000 and mp.getfilesize() < 195000 then
  return mp.INFECTED
end
return mp.CLEAN
