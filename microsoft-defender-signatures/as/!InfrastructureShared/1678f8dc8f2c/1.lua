-- Threat: !InfrastructureShared
-- Name: 1678f8dc8f2c
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
