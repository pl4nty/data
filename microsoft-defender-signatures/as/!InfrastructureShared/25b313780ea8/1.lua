-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b313780ea8\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if (string.find)(l_0_0, "\\program files", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1555.004", "credentialaccess")
return mp.INFECTED

