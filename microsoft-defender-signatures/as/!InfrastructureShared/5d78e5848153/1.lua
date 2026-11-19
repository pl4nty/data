-- Threat: !InfrastructureShared
-- Name: 5d78e5848153
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
