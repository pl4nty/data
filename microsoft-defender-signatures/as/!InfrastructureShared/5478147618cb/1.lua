-- Threat: !InfrastructureShared
-- Name: 5478147618cb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
