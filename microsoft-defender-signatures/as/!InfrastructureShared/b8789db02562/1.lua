-- Threat: !InfrastructureShared
-- Name: b8789db02562
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
