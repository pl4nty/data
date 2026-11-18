-- Threat: !InfrastructureShared
-- Name: 39780fa0c115
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
