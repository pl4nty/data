-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11ed744ca09a9\0x00007f33_luac 

-- params : ...
-- function num : 0
if IsProcNameInParentProcessTree("cmdhstr", "python.exe") then
  return mp.INFECTED
end
return mp.CLEAN

