-- Threat: !InfrastructureShared
-- Name: 6578f1c595a6
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
