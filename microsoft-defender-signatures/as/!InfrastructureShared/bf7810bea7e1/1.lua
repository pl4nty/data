-- Threat: !InfrastructureShared
-- Name: bf7810bea7e1
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
