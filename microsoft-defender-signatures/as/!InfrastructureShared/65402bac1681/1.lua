-- Threat: !InfrastructureShared
-- Name: 65402bac1681
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
