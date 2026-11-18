-- Threat: !InfrastructureShared
-- Name: 60788b76a0eb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
