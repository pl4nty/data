-- Threat: !InfrastructureShared
-- Name: 12178af14119e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
