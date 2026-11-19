-- Threat: !InfrastructureShared
-- Name: 2678b2ae167f
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
