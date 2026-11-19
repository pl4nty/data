-- Threat: !InfrastructureShared
-- Name: 62786bdc95f8
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
