-- Threat: !InfrastructureShared
-- Name: 5a783c901083
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
