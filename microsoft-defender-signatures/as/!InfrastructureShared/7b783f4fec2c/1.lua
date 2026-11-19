-- Threat: !InfrastructureShared
-- Name: 7b783f4fec2c
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
