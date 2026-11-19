-- Threat: !InfrastructureShared
-- Name: 14278c53d2cf4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
