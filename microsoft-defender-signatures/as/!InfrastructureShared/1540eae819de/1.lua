-- Threat: !InfrastructureShared
-- Name: 1540eae819de
-- Type: 21

if peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
