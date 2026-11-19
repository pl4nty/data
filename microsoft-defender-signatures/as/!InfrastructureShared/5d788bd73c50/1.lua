-- Threat: !InfrastructureShared
-- Name: 5d788bd73c50
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
