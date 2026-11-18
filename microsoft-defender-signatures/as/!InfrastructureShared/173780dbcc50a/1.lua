-- Threat: !InfrastructureShared
-- Name: 173780dbcc50a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
