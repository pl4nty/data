-- Threat: !InfrastructureShared
-- Name: cf786a1759b1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
