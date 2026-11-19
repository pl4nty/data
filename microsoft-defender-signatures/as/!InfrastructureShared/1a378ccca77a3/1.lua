-- Threat: !InfrastructureShared
-- Name: 1a378ccca77a3
-- Type: 21

if pehdr.NumberOfSections >= 4 and (pesecs[4].Name == ".Lax503" or pesecs[3].Name == ".Lax503" or pesecs[2].Name == ".On59" or pesecs[3].Name == ".On59" or pesecs[3].Name == ".Zek" or pesecs[2].Name == ".Reel" or pesecs[3].Name == ".Obis" or pesecs[3].Name == ".mon887" or pesecs[3].Name == ".Much" or pesecs[3].Name == ".oypac" or pesecs[4].Name == ".jibmed" or pesecs[4].Name == ".Much" or pesecs[2].Name == ".Waeson" or 2 <= mp.HSTR_WEIGHT) then
  return mp.INFECTED
end
return mp.CLEAN
