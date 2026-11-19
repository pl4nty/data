-- Threat: !InfrastructureShared
-- Name: 5878012c65eb
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
