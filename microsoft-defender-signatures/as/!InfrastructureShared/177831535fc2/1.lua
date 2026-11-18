-- Threat: !InfrastructureShared
-- Name: 177831535fc2
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
