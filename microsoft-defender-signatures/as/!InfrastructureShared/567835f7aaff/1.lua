-- Threat: !InfrastructureShared
-- Name: 567835f7aaff
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
