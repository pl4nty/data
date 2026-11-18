-- Threat: !InfrastructureShared
-- Name: 6778c2e665fe
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
