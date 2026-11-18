-- Threat: !InfrastructureShared
-- Name: 83781f93b1f8
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
