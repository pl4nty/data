-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!DukstenA\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
if (mp.readu_u32)(epcode, 1) ~= 12520 then
  return mp.CLEAN
end
if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.epscn_islast == false then
  return mp.CLEAN
end
if (pesecs[pehdr.NumberOfSections]).SizeOfRawData <= 10240 then
  return mp.CLEAN
end
if (mp.crc32)(-1, epcode, 38, 16) ~= 3579481926 then
  return mp.CLEAN
end
return mp.INFECTED

