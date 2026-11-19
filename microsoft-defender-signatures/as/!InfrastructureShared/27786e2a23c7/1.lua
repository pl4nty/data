-- Threat: !InfrastructureShared
-- Name: 27786e2a23c7
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
