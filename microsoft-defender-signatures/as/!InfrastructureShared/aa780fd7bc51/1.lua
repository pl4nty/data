-- Threat: !InfrastructureShared
-- Name: aa780fd7bc51
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
