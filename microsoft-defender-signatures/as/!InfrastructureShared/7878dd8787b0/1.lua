-- Threat: !InfrastructureShared
-- Name: 7878dd8787b0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
