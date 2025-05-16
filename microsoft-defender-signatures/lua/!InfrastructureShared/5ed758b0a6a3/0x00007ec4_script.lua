-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5ed758b0a6a3\0x00007ec4_luac 

-- params : ...
-- function num : 0
if IsProcNameInParentProcessTree("cmdhstr", "python.exe") then
  return mp.INFECTED
end
return mp.CLEAN

