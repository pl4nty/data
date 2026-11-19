-- Threat: !InfrastructureShared
-- Name: 30785149e2b0
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
