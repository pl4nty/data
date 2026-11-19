-- Threat: !InfrastructureShared
-- Name: 23b78c36435f7
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
