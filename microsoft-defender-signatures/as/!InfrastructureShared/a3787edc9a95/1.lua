-- Threat: !InfrastructureShared
-- Name: a3787edc9a95
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
