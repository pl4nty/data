-- Threat: !InfrastructureShared
-- Name: f078a4cd1b00
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
