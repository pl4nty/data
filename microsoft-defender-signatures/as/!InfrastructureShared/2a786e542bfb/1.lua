-- Threat: !InfrastructureShared
-- Name: 2a786e542bfb
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
