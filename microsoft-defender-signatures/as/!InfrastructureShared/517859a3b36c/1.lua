-- Threat: !InfrastructureShared
-- Name: 517859a3b36c
-- Type: 21

if peattributes.amd64_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
