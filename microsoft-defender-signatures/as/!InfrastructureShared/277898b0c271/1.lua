-- Threat: !InfrastructureShared
-- Name: 277898b0c271
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
