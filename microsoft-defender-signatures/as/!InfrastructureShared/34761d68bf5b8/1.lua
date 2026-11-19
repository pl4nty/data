-- Threat: !InfrastructureShared
-- Name: 34761d68bf5b8
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
