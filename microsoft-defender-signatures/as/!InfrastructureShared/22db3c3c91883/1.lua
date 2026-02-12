-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\22db3c3c91883\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "\\windows defender\\msmpeng.exe", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_excl_sys32_dll")
return mp.INFECTED

