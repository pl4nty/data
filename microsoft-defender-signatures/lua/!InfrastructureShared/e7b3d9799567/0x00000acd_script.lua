-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e7b3d9799567\0x00000acd_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_SuspiciousCommandExecution")
TrackPidAndTechniqueBM("BM", "T1105", "DefeseEvasion_DeobfuscateFilesOrInformation_Base64EncodeCommandExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

