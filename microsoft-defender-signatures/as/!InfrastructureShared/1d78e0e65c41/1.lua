-- Threat: !InfrastructureShared
-- Name: 1d78e0e65c41
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
