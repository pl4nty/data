-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLUASuspiciousImportSequence\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (pe.get_imports)()
if l_0_1 == nil or l_0_0 < 8 then
  return mp.CLEAN
end
local l_0_2 = {}
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = {}
local l_0_6 = {}
local l_0_7 = {}
-- DECOMPILER ERROR at PC18: No list found for R7 , SetList fails

local l_0_8 = {}
local l_0_9 = {}
-- DECOMPILER ERROR at PC33: No list found for R9 , SetList fails

local l_0_10 = {}
-- DECOMPILER ERROR at PC51: No list found for R10 , SetList fails

-- DECOMPILER ERROR at PC60: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC61: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R5 in 'AssignReg'

for l_0_6 = l_0_3, l_0_4, l_0_5 do
  -- DECOMPILER ERROR at PC64: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC70: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC71: Overwrote pending register: R9 in 'AssignReg'

  if l_0_7 ~= nil then
    for i = l_0_8, l_0_9, l_0_10 do
      -- DECOMPILER ERROR at PC74: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC77: Overwrote pending register: R7 in 'AssignReg'

      if l_0_7 == nil then
        break
      else
        if l_0_7[1] == true then
          if l_0_7[2] ~= nil then
            (mp.set_mpattribute)("ImportSequenceSignature_" .. l_0_7[2])
          end
          return mp.INFECTED
        end
      end
    end
  end
end
-- DECOMPILER ERROR at PC99: Overwrote pending register: R3 in 'AssignReg'

do return l_0_3.CLEAN end
-- DECOMPILER ERROR at PC102: Confused about usage of register R10 for local variables in 'ReleaseLocals'

-- WARNING: undefined locals caused missing assignments!

