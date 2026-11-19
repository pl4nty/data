-- Threat: !InfrastructureShared
-- Name: 7a7856b44af0
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == false then
  return mp.INFECTED
end
return mp.CLEAN
