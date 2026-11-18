-- Threat: !InfrastructureShared
-- Name: 3378186be46e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
