-- Threat: !InfrastructureShared
-- Name: 437827bb6780
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
