-- Threat: !InfrastructureShared
-- Name: 257859c36389
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
