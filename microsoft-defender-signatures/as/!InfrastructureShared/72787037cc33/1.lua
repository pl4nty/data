-- Threat: !InfrastructureShared
-- Name: 72787037cc33
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
