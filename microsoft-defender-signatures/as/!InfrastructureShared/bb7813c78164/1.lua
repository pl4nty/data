-- Threat: !InfrastructureShared
-- Name: bb7813c78164
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
