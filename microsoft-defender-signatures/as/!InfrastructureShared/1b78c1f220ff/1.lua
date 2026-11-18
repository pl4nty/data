-- Threat: !InfrastructureShared
-- Name: 1b78c1f220ff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
