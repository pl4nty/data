-- Threat: !InfrastructureShared
-- Name: 6f784c41a630
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
