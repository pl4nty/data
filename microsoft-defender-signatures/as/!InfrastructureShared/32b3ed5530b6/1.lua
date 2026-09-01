-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3ed5530b6\1.luac 

-- params : ...
-- function num : 0
do
  local l_0_0 = (bm.get_imagepath)() or ""
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = (string.lower)(l_0_0)
  if l_0_1 == "" then
    return mp.CLEAN
  end
  local l_0_2 = contains
  local l_0_3 = l_0_1
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC22: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC26: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC27: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC30: Overwrote pending register: R4 in 'AssignReg'

  if l_0_2 then
    l_0_2(l_0_3, l_0_4, ("/bun-dl-").RelatedStringBMReport)
    -- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC34: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

    l_0_2(l_0_3, l_0_4, "npm_bun_temp_exec")
    -- DECOMPILER ERROR at PC38: Overwrote pending register: R1 in 'AssignReg'

    l_0_2()
    -- DECOMPILER ERROR at PC40: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC41: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC47: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC48: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC51: Overwrote pending register: R6 in 'AssignReg'

    if not l_0_2 and l_0_3 then
      l_0_4("bmInfoFailReason", ("/trinnyyyy-")("/doubletrinnys-"), bm.RelatedStringBMReport)
    end
    -- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC57: Overwrote pending register: R3 in 'AssignReg'

    return l_0_4
  end
  -- DECOMPILER ERROR at PC59: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Overwrote pending register: R1 in 'AssignReg'

  return l_0_2
end

