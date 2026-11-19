-- Threat: !InfrastructureShared
-- Name: 7578e47d6c78
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
