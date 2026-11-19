-- Threat: !InfrastructureShared
-- Name: ca7815951cec
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
