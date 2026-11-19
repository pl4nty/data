-- Threat: !InfrastructureShared
-- Name: 4d789d57aaad
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
