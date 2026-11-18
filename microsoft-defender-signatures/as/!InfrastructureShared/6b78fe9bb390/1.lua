-- Threat: !InfrastructureShared
-- Name: 6b78fe9bb390
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
