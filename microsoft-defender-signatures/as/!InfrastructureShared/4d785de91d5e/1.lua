-- Threat: !InfrastructureShared
-- Name: 4d785de91d5e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
