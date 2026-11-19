-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVFirstUnsignedPEInZipFile
-- Type: 9
-- MpAttributes: //AGGREGATOR:GIOAVTopLevelZIP & !RPF:TopLevelFile & !PEPCODE:HasDigitalSignature & !//GIOAVFirstUnsignedPEInTopLevelZipFile

mp.set_mpattribute("Lua:IOAVFirstUnsignedPEInTopLevelZipFile")
mp.set_mpattribute("//GIOAVFirstUnsignedPEInTopLevelZipFile")
mp.set_mpattribute("MpNonCachedLowfi")
return mp.CLEAN
