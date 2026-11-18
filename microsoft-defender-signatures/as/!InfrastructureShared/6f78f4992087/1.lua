-- Threat: !InfrastructureShared
-- Name: 6f78f4992087
-- Type: 21

if peattributes.no_security and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
