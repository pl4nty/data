-- Threat: !InfrastructureShared
-- Name: 447810cbc90a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
