-- Threat: !InfrastructureShared
-- Name: 3d783bbd7918
-- Type: 21

if pesecs[2].Name == "UPX1" and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
