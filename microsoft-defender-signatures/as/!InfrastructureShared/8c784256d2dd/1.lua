-- Threat: !InfrastructureShared
-- Name: 8c784256d2dd
-- Type: 21

if peattributes.no_security and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
