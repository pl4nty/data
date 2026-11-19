-- Threat: !InfrastructureShared
-- Name: 9540c1a94afe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
