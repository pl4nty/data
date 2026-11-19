-- Threat: !InfrastructureShared
-- Name: 3b7890dbb07b
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
