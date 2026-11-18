-- Threat: !InfrastructureShared
-- Name: 5078cf66536e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
