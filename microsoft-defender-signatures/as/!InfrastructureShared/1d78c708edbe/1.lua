-- Threat: !InfrastructureShared
-- Name: 1d78c708edbe
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
