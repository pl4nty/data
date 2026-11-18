-- Threat: !InfrastructureShared
-- Name: 3b7879c741f8
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
