-- Threat: !InfrastructureShared
-- Name: 7f7806aa7998
-- Type: 21

if peattributes.no_security and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
