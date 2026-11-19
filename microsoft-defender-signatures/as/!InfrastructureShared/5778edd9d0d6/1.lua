-- Threat: !InfrastructureShared
-- Name: 5778edd9d0d6
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
