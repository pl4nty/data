-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#AGGRFileDroppedOverSmbExcl\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("BM_MZ_FILE") then
  (mp.set_mpattribute)("Lua:RemoteCopyExclusions")
  return mp.INFECTED
end
return mp.CLEAN

