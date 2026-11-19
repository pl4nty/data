-- Threat: !InfrastructureShared
-- Name: 797819e96a1e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
