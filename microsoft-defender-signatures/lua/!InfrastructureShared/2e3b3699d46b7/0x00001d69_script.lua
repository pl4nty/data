-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2e3b3699d46b7\0x00001d69_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and IsExcludedByImagePath(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = 50000000
if l_0_1 < (bm.GetSignatureMatchDuration)() then
  return mp.CLEAN
end
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1068", "exploit-privesc")
return mp.INFECTED

