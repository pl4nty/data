-- Threat: !InfrastructureShared
-- Name: 477823197159
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
