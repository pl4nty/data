-- Threat: !InfrastructureShared
-- Name: 4b781202594b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
