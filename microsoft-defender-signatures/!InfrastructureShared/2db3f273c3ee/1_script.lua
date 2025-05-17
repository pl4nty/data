-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db3f273c3ee\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if not l_0_0 or not l_0_0.utf8p2 then
  return mp.CLEAN
end
takeMemorySnapshot(l_0_0.utf8p2)
return mp.INFECTED

