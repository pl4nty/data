-- Threat: !InfrastructureShared
-- Name: d5405183c707
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
