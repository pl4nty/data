-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e7b3e8cfd8d6\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC34: Unhandled construct in 'MakeBoolean' P3

if ((this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil) or not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
  TrackPidAndTechniqueBM("BM", "T1489", "Impact_ServiceStop_Oracle")
end
return mp.CLEAN

