-- Threat: !InfrastructureShared
-- Name: 61785cb945ff
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
