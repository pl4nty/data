-- Threat: !InfrastructureShared
-- Name: 3e783ca640e0
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
