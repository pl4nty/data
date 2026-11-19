-- Threat: !InfrastructureShared
-- Name: bb780a46c2f9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
