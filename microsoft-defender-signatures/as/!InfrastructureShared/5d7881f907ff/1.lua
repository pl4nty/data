-- Threat: !InfrastructureShared
-- Name: 5d7881f907ff
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
