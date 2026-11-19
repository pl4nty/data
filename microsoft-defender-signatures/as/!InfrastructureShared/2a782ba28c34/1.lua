-- Threat: !InfrastructureShared
-- Name: 2a782ba28c34
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
