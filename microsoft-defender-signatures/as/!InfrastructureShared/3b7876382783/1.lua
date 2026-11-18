-- Threat: !InfrastructureShared
-- Name: 3b7876382783
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
