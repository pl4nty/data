-- Threat: !InfrastructureShared
-- Name: 10a78b2495234
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
