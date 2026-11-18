-- Threat: !InfrastructureShared
-- Name: 2d78f6d453e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
