-- Threat: !InfrastructureShared
-- Name: 9078970a2246
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
