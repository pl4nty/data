-- Threat: !InfrastructureShared
-- Name: 6078e9b9134f
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
