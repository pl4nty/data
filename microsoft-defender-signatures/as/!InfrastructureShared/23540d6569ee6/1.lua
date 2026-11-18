-- Threat: !InfrastructureShared
-- Name: 23540d6569ee6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
