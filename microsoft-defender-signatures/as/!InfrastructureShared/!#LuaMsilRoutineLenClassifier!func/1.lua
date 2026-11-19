-- Threat: !InfrastructureShared
-- Name: !#Lua:MsilRoutineLenClassifier!func
-- Type: 10
-- MpAttributes: pea_ismsil & RPF:TopLevelFile

if pe.get_netmetadata() then
  mp.set_mpattribute("Lua:MsilRoutineLenClassifier")
end
return mp.CLEAN
