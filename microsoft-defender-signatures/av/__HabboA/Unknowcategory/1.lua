-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\__HabboA\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if (pesecs[pehdr.NumberOfSections]).VirtualSize ~= 12 then
  return mp.CLEAN
end
if (pesecs[pehdr.NumberOfSections]).SizeOfRawData ~= 4096 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_0 = (mp.readfile)((pesecs[1]).PointerToRawData + 112, 768)
if (mp.crc32)(-1, l_0_0, 1, 80) ~= 777479262 then
  return mp.CLEAN
end
if (mp.crc32)(-1, l_0_0, 391, 224) ~= 2819275930 then
  return mp.CLEAN
end
return mp.INFECTED

