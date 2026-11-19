-- Threat: !InfrastructureShared
-- Name: 4a7837f5456f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
