-- Threat: !InfrastructureShared
-- Name: 5a7836fc454a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
