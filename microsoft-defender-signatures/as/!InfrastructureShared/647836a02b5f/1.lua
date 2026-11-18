-- Threat: !InfrastructureShared
-- Name: 647836a02b5f
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
