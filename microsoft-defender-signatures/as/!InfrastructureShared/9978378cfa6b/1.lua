-- Threat: !InfrastructureShared
-- Name: 9978378cfa6b
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
