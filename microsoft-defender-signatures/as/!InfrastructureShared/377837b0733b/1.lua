-- Threat: !InfrastructureShared
-- Name: 377837b0733b
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
