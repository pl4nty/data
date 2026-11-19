-- Threat: !InfrastructureShared
-- Name: 417893efc1c7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
