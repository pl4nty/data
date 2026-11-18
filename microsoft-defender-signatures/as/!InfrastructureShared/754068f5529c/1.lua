-- Threat: !InfrastructureShared
-- Name: 754068f5529c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
