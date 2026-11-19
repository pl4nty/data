-- Threat: !InfrastructureShared
-- Name: 4a781f64f6da
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
