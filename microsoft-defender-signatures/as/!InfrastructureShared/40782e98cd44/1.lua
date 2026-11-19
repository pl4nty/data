-- Threat: !InfrastructureShared
-- Name: 40782e98cd44
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
