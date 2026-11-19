-- Threat: !InfrastructureShared
-- Name: 4f78ecd1b00a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
