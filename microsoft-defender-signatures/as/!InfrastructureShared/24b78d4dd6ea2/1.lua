-- Threat: !InfrastructureShared
-- Name: 24b78d4dd6ea2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
