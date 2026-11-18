-- Threat: !InfrastructureShared
-- Name: 2537839392567
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
