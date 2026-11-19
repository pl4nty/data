-- Threat: !InfrastructureShared
-- Name: 12c783470364c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
