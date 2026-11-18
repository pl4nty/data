-- Threat: !InfrastructureShared
-- Name: 3178524dc88f
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
