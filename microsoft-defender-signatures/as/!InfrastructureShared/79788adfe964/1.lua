-- Threat: !InfrastructureShared
-- Name: 79788adfe964
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
