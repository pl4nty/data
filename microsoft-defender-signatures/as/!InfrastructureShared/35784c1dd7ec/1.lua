-- Threat: !InfrastructureShared
-- Name: 35784c1dd7ec
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
