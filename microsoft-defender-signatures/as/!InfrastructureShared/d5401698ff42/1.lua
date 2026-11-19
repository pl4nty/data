-- Threat: !InfrastructureShared
-- Name: d5401698ff42
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
