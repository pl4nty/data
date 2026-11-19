-- Threat: !InfrastructureShared
-- Name: 15403293b338
-- Type: 21

if peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
