-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb39b20684e\0x00000387_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1048", "ExfiltrationOverAlternativeProtocol")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

