-- Threat: !InfrastructureShared
-- Name: 4d78712c995e
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
