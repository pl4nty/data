-- Threat: !InfrastructureShared
-- Name: 86781d36315e
-- Type: 21

if peattributes.no_security and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
