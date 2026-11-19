-- Threat: !InfrastructureShared
-- Name: 18378235f0d48
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
