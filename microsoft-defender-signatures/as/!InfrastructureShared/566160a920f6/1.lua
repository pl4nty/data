-- Threat: !InfrastructureShared
-- Name: 566160a920f6
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
