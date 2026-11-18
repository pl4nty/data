-- Threat: !InfrastructureShared
-- Name: 3178eb4cc1e6
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
