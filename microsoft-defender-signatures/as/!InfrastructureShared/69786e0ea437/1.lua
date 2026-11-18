-- Threat: !InfrastructureShared
-- Name: 69786e0ea437
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
