-- Threat: !InfrastructureShared
-- Name: 17e781361bf54
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
