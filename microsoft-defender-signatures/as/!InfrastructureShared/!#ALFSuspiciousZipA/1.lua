-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFSuspiciousZipA\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() < 30 then
  return mp.CLEAN
end
if (mp.readheader)(8, 2) ~= "\000\000" then
  return mp.CLEAN
end
if (mp.readu_u32)(headerpage, 19) ~= (mp.readu_u32)(headerpage, 23) then
  return mp.INFECTED
end
return mp.CLEAN

