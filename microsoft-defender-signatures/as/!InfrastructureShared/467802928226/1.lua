-- Threat: !InfrastructureShared
-- Name: 467802928226
-- Type: 21

if peattributes.isdll and peattributes.amd64_image and peattributes.no_resources then
  return mp.INFECTED
end
return mp.CLEAN
