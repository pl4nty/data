-- Threat: !InfrastructureShared
-- Name: 3e7895420d83
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
