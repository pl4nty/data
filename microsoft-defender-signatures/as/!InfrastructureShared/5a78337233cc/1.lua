-- Threat: !InfrastructureShared
-- Name: 5a78337233cc
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
