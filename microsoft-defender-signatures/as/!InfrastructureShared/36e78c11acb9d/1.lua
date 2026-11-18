-- Threat: !InfrastructureShared
-- Name: 36e78c11acb9d
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.SUSPICIOUS
