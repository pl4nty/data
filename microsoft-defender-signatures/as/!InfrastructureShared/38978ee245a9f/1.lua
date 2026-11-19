-- Threat: !InfrastructureShared
-- Name: 38978ee245a9f
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
