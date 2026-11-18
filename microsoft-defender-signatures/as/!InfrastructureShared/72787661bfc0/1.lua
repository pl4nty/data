-- Threat: !InfrastructureShared
-- Name: 72787661bfc0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
