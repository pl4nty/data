-- Threat: !InfrastructureShared
-- Name: 3f786879c837
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
