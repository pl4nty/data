-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000bfe_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0, l_0_2 = nil, nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 == nil then
    return mp.CLEAN
  end
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
      local l_0_1, l_0_3 = , (this_sigattrlog[2]).utf8p2
    end
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_3 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC39: Overwrote pending register: R2 in 'AssignReg'

    local l_0_4 = nil
    if nil == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

    if nil == l_0_4 then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end

