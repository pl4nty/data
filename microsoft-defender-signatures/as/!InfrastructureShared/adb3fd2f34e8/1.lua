-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3fd2f34e8\1.luac 

-- params : ...
-- function num : 0
if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN

