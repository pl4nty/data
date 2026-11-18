-- Threat: !InfrastructureShared
-- Name: 3f78687af440
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
