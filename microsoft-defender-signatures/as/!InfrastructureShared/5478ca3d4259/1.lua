-- Threat: !InfrastructureShared
-- Name: 5478ca3d4259
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
