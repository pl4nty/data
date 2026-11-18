-- Threat: !InfrastructureShared
-- Name: 6b788afb86e1
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
