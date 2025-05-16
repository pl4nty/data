-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b393f4b0e4\0x00009cbb_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1003.001", "credentialdumping", 86400)
  return mp.INFECTED
end
return mp.CLEAN

