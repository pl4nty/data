-- Threat: !InfrastructureShared
-- Name: 7e78aad354f8
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
