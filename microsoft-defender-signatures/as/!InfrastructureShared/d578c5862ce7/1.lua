-- Threat: !InfrastructureShared
-- Name: d578c5862ce7
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
