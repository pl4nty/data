-- Threat: !InfrastructureShared
-- Name: 6a78d64984f4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
