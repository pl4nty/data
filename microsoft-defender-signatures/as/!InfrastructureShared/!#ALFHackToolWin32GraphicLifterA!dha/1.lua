-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolWin32GraphicLifterA!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 > 307200 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (pe.get_exports)()
if l_0_2 == nil or (l_0_2[1]).namerva == nil or (l_0_2[1]).rva == nil then
  return mp.CLEAN
end
local l_0_3 = (pe.mmap_string_rva)((l_0_2[1]).namerva, 8)
if l_0_3 == nil or l_0_3 ~= "Printer" then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_4 = (mp.readfile)((pe.foffset_rva)((l_0_2[1]).rva), 9)
;
(mp.readprotection)(true)
if l_0_4 == nil or l_0_4 ~= "UãÏÅÏ\016\001\000\000" then
  return mp.CLEAN
end
return mp.INFECTED

