-- Threat: !InfrastructureShared
-- Name: 2278f04ec6fb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
