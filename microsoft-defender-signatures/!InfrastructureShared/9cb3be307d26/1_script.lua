-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb3be307d26\1_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1040", "Discovery_NetworkCapture_Sniffing_mt2023")
AddTechniqueGlobal("Discovery_NetworkCapture_Sniffing")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

