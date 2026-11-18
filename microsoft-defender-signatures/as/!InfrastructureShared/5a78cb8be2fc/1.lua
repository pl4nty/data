-- Threat: !InfrastructureShared
-- Name: 5a78cb8be2fc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
