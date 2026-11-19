-- Threat: !InfrastructureShared
-- Name: 467885c441db
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
