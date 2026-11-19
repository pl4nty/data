-- Threat: !InfrastructureShared
-- Name: 84782c43f296
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
