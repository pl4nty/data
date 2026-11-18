-- Threat: !InfrastructureShared
-- Name: 3578eb4e1f94
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
