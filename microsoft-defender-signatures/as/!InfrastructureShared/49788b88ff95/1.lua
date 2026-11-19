-- Threat: !InfrastructureShared
-- Name: 49788b88ff95
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
