-- Threat: !InfrastructureShared
-- Name: 2f678b92af753
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
