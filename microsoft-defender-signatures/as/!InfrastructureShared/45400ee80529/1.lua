-- Threat: !InfrastructureShared
-- Name: 45400ee80529
-- Type: 21

if peattributes.x86_image and peattributes.packed then
  return mp.INFECTED
end
return mp.CLEAN
