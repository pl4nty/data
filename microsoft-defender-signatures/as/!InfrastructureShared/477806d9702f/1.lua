-- Threat: !InfrastructureShared
-- Name: 477806d9702f
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
