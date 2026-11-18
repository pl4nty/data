-- Threat: !InfrastructureShared
-- Name: b47866d0acc5
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
