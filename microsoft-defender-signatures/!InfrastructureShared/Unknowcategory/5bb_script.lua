-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\5bb_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil, nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    local l_0_2 = nil
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC27: Overwrote pending register: R2 in 'AssignReg'

    if (string.match)(l_0_0, "%.exe\".+\"(.+%.wsf)") ~= nil then
      local l_0_3 = nil
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

      if (sysio.IsFileExists)(nil) then
        (bm.add_related_file)(nil)
        -- DECOMPILER ERROR at PC40: Confused about usage of register: R2 in 'UnsetPending'

        ;
        (mp.ReportLowfi)(nil, 927347397)
        return mp.INFECTED
      end
    end
  end
  do
    return mp.CLEAN
  end
end

