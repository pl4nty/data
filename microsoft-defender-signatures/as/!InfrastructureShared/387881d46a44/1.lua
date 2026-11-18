-- Threat: !InfrastructureShared
-- Name: 387881d46a44
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
