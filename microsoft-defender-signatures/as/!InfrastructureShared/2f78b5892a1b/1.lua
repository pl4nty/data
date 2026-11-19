-- Threat: !InfrastructureShared
-- Name: 2f78b5892a1b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
