-- Threat: !InfrastructureShared
-- Name: 4f783a50a1e6
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
