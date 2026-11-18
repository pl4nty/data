-- Threat: !InfrastructureShared
-- Name: 5b786d4cd63c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
