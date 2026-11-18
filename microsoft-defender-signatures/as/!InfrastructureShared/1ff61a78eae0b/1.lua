-- Threat: !InfrastructureShared
-- Name: 1ff61a78eae0b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
