-- Threat: !InfrastructureShared
-- Name: 6b78fbd3a6fb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
