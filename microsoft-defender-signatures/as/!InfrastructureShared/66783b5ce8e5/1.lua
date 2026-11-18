-- Threat: !InfrastructureShared
-- Name: 66783b5ce8e5
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
