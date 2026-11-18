-- Threat: !InfrastructureShared
-- Name: 4b78e8fb352a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
