-- Threat: !InfrastructureShared
-- Name: dd78c1b8c3fb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
