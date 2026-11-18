-- Threat: !InfrastructureShared
-- Name: 1d78f16043e3
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
