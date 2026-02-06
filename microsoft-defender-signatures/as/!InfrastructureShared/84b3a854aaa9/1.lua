-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3a854aaa9\1.luac 

-- params : ...
-- function num : 0
if not IsNoisyWebProc() then
  return mp.INFECTED
end
return mp.CLEAN

