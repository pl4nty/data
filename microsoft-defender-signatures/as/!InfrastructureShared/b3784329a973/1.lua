-- Threat: !InfrastructureShared
-- Name: b3784329a973
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
