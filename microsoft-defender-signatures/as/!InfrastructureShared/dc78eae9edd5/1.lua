-- Threat: !InfrastructureShared
-- Name: dc78eae9edd5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
