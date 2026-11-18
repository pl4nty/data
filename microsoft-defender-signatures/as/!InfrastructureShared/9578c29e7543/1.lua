-- Threat: !InfrastructureShared
-- Name: 9578c29e7543
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
