-- Threat: !InfrastructureShared
-- Name: cf78c2abd62d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
