-- Threat: !InfrastructureShared
-- Name: 727879b0f1f1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
