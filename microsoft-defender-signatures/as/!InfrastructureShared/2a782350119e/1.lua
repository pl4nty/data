-- Threat: !InfrastructureShared
-- Name: 2a782350119e
-- Type: 21

if peattributes.no_security == true and pesecs[3].Name == ".ACE0" and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
