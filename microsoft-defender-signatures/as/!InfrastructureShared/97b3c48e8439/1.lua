-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\97b3c48e8439\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_ExfiltrationOverAlternativeProtocol_AsymmetricEncryptedNonC2Protocol")
;
(bm.trigger_sig)("BM_FileUploadOverUsingSCP", "Detected")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

