-- Threat: !InfrastructureShared
-- Name: 13f788910419b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
