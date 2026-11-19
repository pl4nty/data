-- Threat: !InfrastructureShared
-- Name: 437889bfffcb
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
