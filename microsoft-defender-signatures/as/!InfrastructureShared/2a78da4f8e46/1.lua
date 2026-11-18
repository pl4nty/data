-- Threat: !InfrastructureShared
-- Name: 2a78da4f8e46
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
