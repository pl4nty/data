-- Threat: !InfrastructureShared
-- Name: 28789c874c7b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
