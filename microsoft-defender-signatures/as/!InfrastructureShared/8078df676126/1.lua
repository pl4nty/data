-- Threat: !InfrastructureShared
-- Name: 8078df676126
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
