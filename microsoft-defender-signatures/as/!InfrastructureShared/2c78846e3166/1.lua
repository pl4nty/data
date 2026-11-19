-- Threat: !InfrastructureShared
-- Name: 2c78846e3166
-- Type: 21

if peattributes.amd64_image and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
