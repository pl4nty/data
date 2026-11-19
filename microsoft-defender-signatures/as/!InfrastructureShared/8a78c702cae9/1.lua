-- Threat: !InfrastructureShared
-- Name: 8a78c702cae9
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
