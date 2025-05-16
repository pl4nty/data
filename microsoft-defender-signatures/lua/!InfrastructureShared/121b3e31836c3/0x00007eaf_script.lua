-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\121b3e31836c3\0x00007eaf_luac 

-- params : ...
-- function num : 0
if IsProcNameInParentProcessTree("BM", "windeploy.exe") then
  return mp.CLEAN
end
return mp.INFECTED

