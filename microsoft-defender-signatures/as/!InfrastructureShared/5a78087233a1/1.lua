-- Threat: !InfrastructureShared
-- Name: 5a78087233a1
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
