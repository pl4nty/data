-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\2a3_962.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p1)
local l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC19: No list found for R2 , SetList fails

do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC21: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC22: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC23: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC25: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC26: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC27: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC28: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ("/microsoft edge$")("/brave browser$") do
    if (string.find)(l_0_1, l_0_8) then
      return mp.CLEAN
    end
  end
  for l_0_12,l_0_13 in ipairs(l_0_3) do
    if (string.find)(l_0_0, l_0_13) then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

