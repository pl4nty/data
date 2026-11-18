-- Threat: !InfrastructureShared
-- Name: 367839f6de67
-- Type: 21

if peattributes.amd64_image and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
