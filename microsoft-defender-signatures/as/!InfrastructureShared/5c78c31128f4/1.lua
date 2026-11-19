-- Threat: !InfrastructureShared
-- Name: 5c78c31128f4
-- Type: 21

if peattributes.executable_image and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
