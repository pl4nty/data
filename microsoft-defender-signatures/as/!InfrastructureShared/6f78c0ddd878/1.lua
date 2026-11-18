-- Threat: !InfrastructureShared
-- Name: 6f78c0ddd878
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
