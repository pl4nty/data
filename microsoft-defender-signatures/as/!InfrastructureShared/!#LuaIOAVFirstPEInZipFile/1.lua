-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVFirstPEInZipFile
-- Type: 8
-- MpAttributes: //AGGREGATOR:GIOAVTopLevelZIP & !RPF:TopLevelFile & !//GIOAVFirstPEInTopLevelZipFile

mp.set_mpattribute("Lua:IOAVFirstPEInTopLevelZipFile")
mp.set_mpattribute("//GIOAVFirstPEInTopLevelZipFile")
mp.set_mpattribute("MpNonCachedLowfi")
return mp.CLEAN
