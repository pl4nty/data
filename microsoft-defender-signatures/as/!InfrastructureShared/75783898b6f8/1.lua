-- Threat: !InfrastructureShared
-- Name: 75783898b6f8
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
