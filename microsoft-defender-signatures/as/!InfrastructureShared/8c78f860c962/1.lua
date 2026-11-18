-- Threat: !InfrastructureShared
-- Name: 8c78f860c962
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
