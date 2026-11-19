-- Threat: !InfrastructureShared
-- Name: 4b78ebd5d9d0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
