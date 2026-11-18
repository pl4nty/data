-- Threat: !InfrastructureShared
-- Name: 7178a07ce563
-- Type: 21

if mp.get_mpattribute("NID:Emotet.BD!Pra1") or mp.get_mpattribute("NID:Emotet.BD!Pra2") or mp.get_mpattribute("NID:Emotet.BD!Pra3") then
  return mp.INFECTED
end
return mp.CLEAN
