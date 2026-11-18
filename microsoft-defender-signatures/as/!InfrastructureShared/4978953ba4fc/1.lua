-- Threat: !InfrastructureShared
-- Name: 4978953ba4fc
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
