-- Threat: !InfrastructureShared
-- Name: b9786ebc22ae
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
