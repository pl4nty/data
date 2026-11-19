-- Threat: !InfrastructureShared
-- Name: 6778010e19cc
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
