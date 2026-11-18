-- Threat: !InfrastructureShared
-- Name: 5c781eb84af1
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
