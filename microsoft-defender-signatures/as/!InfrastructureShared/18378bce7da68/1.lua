-- Threat: !InfrastructureShared
-- Name: 18378bce7da68
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
