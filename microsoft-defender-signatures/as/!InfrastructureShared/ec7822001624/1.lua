-- Threat: !InfrastructureShared
-- Name: ec7822001624
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
