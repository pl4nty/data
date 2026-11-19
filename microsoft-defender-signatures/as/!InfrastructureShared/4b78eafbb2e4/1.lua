-- Threat: !InfrastructureShared
-- Name: 4b78eafbb2e4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
