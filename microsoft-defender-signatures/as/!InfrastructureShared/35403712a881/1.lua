-- Threat: !InfrastructureShared
-- Name: 35403712a881
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
