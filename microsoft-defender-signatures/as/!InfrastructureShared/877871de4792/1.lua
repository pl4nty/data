-- Threat: !InfrastructureShared
-- Name: 877871de4792
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
