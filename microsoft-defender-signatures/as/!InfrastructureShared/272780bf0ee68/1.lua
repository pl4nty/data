-- Threat: !InfrastructureShared
-- Name: 272780bf0ee68
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
