-- Threat: !InfrastructureShared
-- Name: ed78fd0f72ba
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
