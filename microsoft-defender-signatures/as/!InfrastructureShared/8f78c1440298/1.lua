-- Threat: !InfrastructureShared
-- Name: 8f78c1440298
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
