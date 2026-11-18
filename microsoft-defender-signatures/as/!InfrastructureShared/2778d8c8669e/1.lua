-- Threat: !InfrastructureShared
-- Name: 2778d8c8669e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
