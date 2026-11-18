-- Threat: !InfrastructureShared
-- Name: 777833c96b42
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
