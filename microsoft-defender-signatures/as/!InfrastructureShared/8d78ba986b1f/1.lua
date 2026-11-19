-- Threat: !InfrastructureShared
-- Name: 8d78ba986b1f
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
