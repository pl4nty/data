-- Threat: !InfrastructureShared
-- Name: a67843ad92f9
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
