-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4fd701faedc9\1.luac 

-- params : ...
-- function num : 0
if IsProcNameInParentProcessTree("cmdhstr", "wgear.exe") then
  return mp.INFECTED
end
return mp.CLEAN

