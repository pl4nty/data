-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!KlekxaA\Unknowcategory\1.luac 

-- params : ...
-- function num : 0
if pevars.epsec ~= 1 or pehdr.NumberOfSections ~= 2 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_0 = (mp.readfile)((pe.foffset_rva)(pehdr.AddressOfEntryPoint) - 918, 768)
if (mp.crc32)(-1, l_0_0, 1, 768) ~= 3718490045 then
  return mp.CLEAN
end
return mp.INFECTED

