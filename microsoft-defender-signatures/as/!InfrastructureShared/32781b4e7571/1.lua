-- Threat: !InfrastructureShared
-- Name: 32781b4e7571
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
