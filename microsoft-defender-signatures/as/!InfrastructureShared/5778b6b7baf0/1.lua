-- Threat: !InfrastructureShared
-- Name: 5778b6b7baf0
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
