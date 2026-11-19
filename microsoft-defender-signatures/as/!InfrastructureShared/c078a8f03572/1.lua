-- Threat: !InfrastructureShared
-- Name: c078a8f03572
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
