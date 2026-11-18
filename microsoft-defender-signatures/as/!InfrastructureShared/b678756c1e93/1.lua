-- Threat: !InfrastructureShared
-- Name: b678756c1e93
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
