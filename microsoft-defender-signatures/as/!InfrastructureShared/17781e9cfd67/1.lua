-- Threat: !InfrastructureShared
-- Name: 17781e9cfd67
-- Type: 21

if peattributes.amd64_image and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
