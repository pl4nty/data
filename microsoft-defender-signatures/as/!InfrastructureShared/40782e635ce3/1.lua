-- Threat: !InfrastructureShared
-- Name: 40782e635ce3
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
