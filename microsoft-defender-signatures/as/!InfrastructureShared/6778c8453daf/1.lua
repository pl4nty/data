-- Threat: !InfrastructureShared
-- Name: 6778c8453daf
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
