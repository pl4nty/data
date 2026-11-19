-- Threat: !InfrastructureShared
-- Name: b57816d62ad5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
