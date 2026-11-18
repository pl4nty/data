-- Threat: !InfrastructureShared
-- Name: 7278f79a3408
-- Type: 21

if peattributes.no_security and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
