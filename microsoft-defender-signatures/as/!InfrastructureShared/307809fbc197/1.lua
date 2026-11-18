-- Threat: !InfrastructureShared
-- Name: 307809fbc197
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
