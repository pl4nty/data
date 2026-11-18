-- Threat: !InfrastructureShared
-- Name: af78ca30b904
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
