-- Threat: !InfrastructureShared
-- Name: 39c9b0ea03bc
-- Type: 21

if peattributes.amd64_image and peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
