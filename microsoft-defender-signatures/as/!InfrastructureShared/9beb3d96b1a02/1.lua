-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9beb3d96b1a02\1.luac 

-- params : ...
-- function num : 0
if IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN

