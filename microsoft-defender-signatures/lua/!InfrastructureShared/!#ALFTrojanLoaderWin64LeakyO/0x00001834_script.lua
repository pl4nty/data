-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanLoaderWin64LeakyO\0x00001834_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC3: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC4: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("splsamodeinitialize").getfilesize)()
-- DECOMPILER ERROR at PC11: Overwrote pending register: R2 in 'AssignReg'

if l_0_1 < 102400 or l_0_1 > 12582912 then
  return ("servicemain").CLEAN
end
local l_0_2, l_0_3 = (pe.get_exports)()
local l_0_4 = 0
if l_0_2 < 2 or l_0_2 > 7 then
  return mp.CLEAN
end
for l_0_8 = 1, l_0_2 do
  local l_0_9 = (pe.mmap_string_rva)((l_0_3[l_0_8]).namerva, 64)
  if l_0_9 ~= nil then
    for l_0_13,l_0_14 in ipairs(l_0_0) do
      if (string.lower)(l_0_9) == l_0_14 then
        l_0_4 = l_0_4 + 1
      end
      if l_0_4 > 1 then
        return mp.INFECTED
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC59: Confused about usage of register R5 for local variables in 'ReleaseLocals'


