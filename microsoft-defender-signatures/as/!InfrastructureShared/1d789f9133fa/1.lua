-- Threat: !InfrastructureShared
-- Name: 1d789f9133fa
-- Type: 21

if peattributes.no_security and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
