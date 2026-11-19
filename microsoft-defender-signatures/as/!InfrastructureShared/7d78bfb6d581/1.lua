-- Threat: !InfrastructureShared
-- Name: 7d78bfb6d581
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
