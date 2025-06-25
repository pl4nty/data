-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERTrojanWin64VortexMin\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC3: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC4: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("winmain").getfilesize)()
-- DECOMPILER ERROR at PC13: Overwrote pending register: R2 in 'AssignReg'

if l_0_1 == nil or l_0_1 < 3145728 or l_0_1 > 26214400 then
  return ("_cgo_dummy_export").CLEAN
end
if (pe.get_exports_count)() ~= 2 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = (pe.get_exports)()
local l_0_4 = 0
if l_0_3 == nil or l_0_2 ~= 2 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
for l_0_8 = 1, l_0_2 do
  local l_0_9 = (pe.mmap_string_rva)((l_0_3[l_0_8]).namerva, 64)
  if l_0_9 ~= nil then
    for l_0_13,l_0_14 in ipairs(l_0_0) do
      if (string.lower)(l_0_9) == l_0_14 then
        l_0_4 = l_0_4 + 1
      end
      if l_0_4 == 2 then
        return mp.INFECTED
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC73: Confused about usage of register R5 for local variables in 'ReleaseLocals'


