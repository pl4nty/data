-- Threat: !InfrastructureShared
-- Name: c1782759838b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
