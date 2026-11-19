-- Threat: !InfrastructureShared
-- Name: 6978e1a652fc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
