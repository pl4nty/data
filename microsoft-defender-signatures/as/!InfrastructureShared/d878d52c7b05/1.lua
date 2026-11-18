-- Threat: !InfrastructureShared
-- Name: d878d52c7b05
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
