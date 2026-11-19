-- Threat: !InfrastructureShared
-- Name: 4978bf2ab103
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
