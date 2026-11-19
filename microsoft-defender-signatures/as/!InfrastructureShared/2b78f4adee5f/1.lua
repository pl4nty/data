-- Threat: !InfrastructureShared
-- Name: 2b78f4adee5f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
