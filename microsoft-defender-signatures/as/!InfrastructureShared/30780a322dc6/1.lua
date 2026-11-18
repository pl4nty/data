-- Threat: !InfrastructureShared
-- Name: 30780a322dc6
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
