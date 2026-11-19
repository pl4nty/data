-- Threat: !InfrastructureShared
-- Name: 257838bfda6f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
