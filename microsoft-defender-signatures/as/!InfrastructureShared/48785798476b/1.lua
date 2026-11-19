-- Threat: !InfrastructureShared
-- Name: 48785798476b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
