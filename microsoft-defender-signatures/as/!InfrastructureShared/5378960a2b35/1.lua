-- Threat: !InfrastructureShared
-- Name: 5378960a2b35
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
