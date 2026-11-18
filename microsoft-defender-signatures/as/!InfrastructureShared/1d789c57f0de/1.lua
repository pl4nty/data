-- Threat: !InfrastructureShared
-- Name: 1d789c57f0de
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
