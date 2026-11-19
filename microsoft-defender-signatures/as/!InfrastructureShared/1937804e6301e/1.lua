-- Threat: !InfrastructureShared
-- Name: 1937804e6301e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
