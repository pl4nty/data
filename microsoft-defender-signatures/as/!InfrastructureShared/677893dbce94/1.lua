-- Threat: !InfrastructureShared
-- Name: 677893dbce94
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
