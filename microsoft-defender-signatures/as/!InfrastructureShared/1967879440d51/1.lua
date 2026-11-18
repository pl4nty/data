-- Threat: !InfrastructureShared
-- Name: 1967879440d51
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
