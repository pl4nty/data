-- Threat: !InfrastructureShared
-- Name: 11578263ddc06
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
