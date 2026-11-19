-- Threat: !InfrastructureShared
-- Name: 64787f1d02ac
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
