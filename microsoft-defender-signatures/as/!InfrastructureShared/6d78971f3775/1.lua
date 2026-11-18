-- Threat: !InfrastructureShared
-- Name: 6d78971f3775
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
