-- Threat: !InfrastructureShared
-- Name: c978c91ea49d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
