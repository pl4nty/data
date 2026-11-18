-- Threat: !InfrastructureShared
-- Name: 48781d0f01dc
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
