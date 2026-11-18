-- Threat: !InfrastructureShared
-- Name: 4278fb951a3a
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
