-- Threat: !InfrastructureShared
-- Name: 2a7802c53495
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
