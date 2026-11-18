-- Threat: !InfrastructureShared
-- Name: c478e4c50f93
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.amd64_image and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
