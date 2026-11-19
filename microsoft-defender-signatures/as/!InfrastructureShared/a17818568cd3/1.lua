-- Threat: !InfrastructureShared
-- Name: a17818568cd3
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
