-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_1Tick\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
if pehdr.NumberOfSections < pevars.epsec then
  return mp.CLEAN
end
if (mp.bitand)((pesecs[pevars.epsec]).Characteristics, 2147483648) ~= 2147483648 then
  return mp.CLEAN
end
if (pesecs[pehdr.NumberOfSections]).SizeOfRawData < 6200 then
  return mp.CLEAN
end
if (pesecs[pehdr.NumberOfSections]).VirtualSize < 6200 then
  return mp.CLEAN
end
if (mp.readu_u16)(epcode, 1) ~= 59744 then
  return mp.CLEAN
end
if pehdr.MajorImageVersion ~= 21576 then
  return mp.CLEAN
end
if (mp.readu_u16)(epcode, 5) ~= 0 then
  return mp.CLEAN
end
if (mp.readu_u32)(epcode, 3) + 2 > 1024 then
  return mp.CLEAN
end
if (mp.crc32)(-1, fopclog2, 1, 12) ~= 3700182958 then
  return mp.CLEAN
end
return mp.INFECTED

