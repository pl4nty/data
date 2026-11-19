-- Threat: !InfrastructureShared
-- Name: 4c78ba8c805e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
