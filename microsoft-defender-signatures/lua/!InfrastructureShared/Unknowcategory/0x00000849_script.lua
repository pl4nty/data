-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000849_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC25: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1 = (this_sigattrlog[2]).utf8p1
    end
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

    local l_0_2 = (string.lower)(l_0_1)
    local l_0_3 = (string.lower)((this_sigattrlog[4]).utf8p1)
    local l_0_4 = {}
    -- DECOMPILER ERROR at PC42: No list found for R2 , SetList fails

    local l_0_5 = {}
    -- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC45: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC46: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC47: No list found for R3 , SetList fails

    -- DECOMPILER ERROR at PC48: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC49: Overwrote pending register: R5 in 'AssignReg'

    for l_0_9,l_0_10 in ("/safari$")("/mobilesafari$") do
      if (string.find)(l_0_3, l_0_10) then
        return mp.CLEAN
      end
    end
    for l_0_14,l_0_15 in ipairs(l_0_5) do
      if (string.find)(l_0_2, l_0_15) then
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

