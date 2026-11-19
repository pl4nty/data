-- Threat: !InfrastructureShared
-- Name: 6178b904fba1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
