-- Threat: !InfrastructureShared
-- Name: 387814f0468b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
