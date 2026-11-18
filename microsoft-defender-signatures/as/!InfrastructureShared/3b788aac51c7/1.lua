-- Threat: !InfrastructureShared
-- Name: 3b788aac51c7
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
