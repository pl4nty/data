-- Threat: !InfrastructureShared
-- Name: 11378e423b855
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
