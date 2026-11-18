-- Threat: !InfrastructureShared
-- Name: 7d78e0a345bc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
