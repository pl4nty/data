-- Threat: !InfrastructureShared
-- Name: a678e22f17ff
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
