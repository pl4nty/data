-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!#MpIsExhaustiveScriptScan\ObMpAttributes\2.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 2097152 then
  return mp.CLEAN
end
if (mp.BMSearchFile)(0, 4096, "<job\144\000") == -1 then
  return mp.INFECTED
end
return mp.CLEAN

