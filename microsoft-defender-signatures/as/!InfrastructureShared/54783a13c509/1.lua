-- Threat: !InfrastructureShared
-- Name: 54783a13c509
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
