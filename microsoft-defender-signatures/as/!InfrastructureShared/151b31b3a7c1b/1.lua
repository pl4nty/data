-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\151b31b3a7c1b\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC5: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC19: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[5]).matched or (this_sigattrlog[6]).matched then
      local l_0_1 = "powershell"
    else
    end
    -- DECOMPILER ERROR at PC33: Overwrote pending register: R0 in 'AssignReg'

    if not (this_sigattrlog[7]).matched or (this_sigattrlog[8]).matched then
      local l_0_2, l_0_3, l_0_4, l_0_5 = "mshta"
    else
      do
        do return mp.CLEAN end
        -- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

        ;
        (bm.add_related_string)("susp_iis_spawn_child", l_0_2, bm.RelatedStringBMReport)
        add_parents()
        TrackPidAndTechniqueBM("BM", "T1505.003", "iis_worker_susp_spawn", 28800)
        return mp.INFECTED
      end
    end
  end
end

