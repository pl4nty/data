-- Threat: !InfrastructureShared
-- Name: 307847c89a52
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
