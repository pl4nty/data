-- Threat: !InfrastructureShared
-- Name: 2278f5478e85
-- Type: 21

if peattributes.x86_image and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
