-- Threat: !InfrastructureShared
-- Name: b5781c36ae90
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
