-- Threat: !InfrastructureShared
-- Name: 3a78f099d97a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
