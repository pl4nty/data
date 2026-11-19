-- Threat: !InfrastructureShared
-- Name: b97869f5c96d
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
