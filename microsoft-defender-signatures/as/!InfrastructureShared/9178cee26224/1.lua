-- Threat: !InfrastructureShared
-- Name: 9178cee26224
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
