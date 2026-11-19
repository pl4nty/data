-- Threat: !InfrastructureShared
-- Name: 11278c49effe7
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
