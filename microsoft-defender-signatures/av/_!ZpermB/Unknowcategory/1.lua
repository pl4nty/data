-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!ZpermB\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
if (pesecs[pehdr.NumberOfSections]).SizeOfRawData <= 65535 then
  return mp.CLEAN
end
if (pesecs[pehdr.NumberOfSections]).VirtualSize <= 65535 then
  return mp.CLEAN
end
if peattributes.epscn_islast ~= true then
  return mp.CLEAN
end
if (mp.crc32)(-1, fopclog2, 1, 16) ~= 3763490484 then
  return mp.CLEAN
end
return mp.INFECTED

