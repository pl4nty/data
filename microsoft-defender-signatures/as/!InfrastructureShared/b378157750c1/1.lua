-- Threat: !InfrastructureShared
-- Name: b378157750c1
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
