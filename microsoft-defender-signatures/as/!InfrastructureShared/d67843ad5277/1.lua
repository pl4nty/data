-- Threat: !InfrastructureShared
-- Name: d67843ad5277
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
