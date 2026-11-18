-- Threat: !InfrastructureShared
-- Name: 80789dc64bf8
-- Type: 21

if peattributes.amd64_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
