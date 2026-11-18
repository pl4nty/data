-- Threat: !InfrastructureShared
-- Name: 3b783fef6e29
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
