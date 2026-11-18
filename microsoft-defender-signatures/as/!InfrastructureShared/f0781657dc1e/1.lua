-- Threat: !InfrastructureShared
-- Name: f0781657dc1e
-- Type: 21

if peattributes.no_decription and peattributes.suspicious_image_version then
  return mp.INFECTED
end
return mp.CLEAN
