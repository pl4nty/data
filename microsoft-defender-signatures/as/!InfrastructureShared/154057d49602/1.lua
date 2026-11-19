-- Threat: !InfrastructureShared
-- Name: 154057d49602
-- Type: 21

if peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
