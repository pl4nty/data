-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17ab380319e72\0x000009b6_luac 

-- params : ...
-- function num : 0
if IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") then
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN

