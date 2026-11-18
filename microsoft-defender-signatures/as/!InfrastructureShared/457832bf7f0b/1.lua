-- Threat: !InfrastructureShared
-- Name: 457832bf7f0b
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
