-- Threat: !InfrastructureShared
-- Name: 91786e4eddae
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
