-- Threat: !InfrastructureShared
-- Name: 5878ecfb133e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
