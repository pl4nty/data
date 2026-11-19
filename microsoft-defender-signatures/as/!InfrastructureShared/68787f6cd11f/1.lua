-- Threat: !InfrastructureShared
-- Name: 68787f6cd11f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
