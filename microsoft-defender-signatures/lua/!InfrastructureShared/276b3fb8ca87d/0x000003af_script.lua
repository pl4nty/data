-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\276b3fb8ca87d\0x000003af_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[8]).matched or (this_sigattrlog[8]).utf8p1 == nil or (this_sigattrlog[9]).matched) and (this_sigattrlog[9]).utf8p1 ~= nil then
      local l_0_1 = (this_sigattrlog[8]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[10]).matched or (this_sigattrlog[10]).utf8p1 == nil or (this_sigattrlog[11]).matched) and (this_sigattrlog[11]).utf8p1 ~= nil then
        local l_0_2 = (this_sigattrlog[10]).utf8p1
      else
      end
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[12]).matched or (this_sigattrlog[12]).utf8p1 == nil or (this_sigattrlog[13]).matched) and (this_sigattrlog[13]).utf8p1 ~= nil then
          local l_0_3, l_0_4, l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = (this_sigattrlog[12]).utf8p1
        end
        -- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

        if l_0_3 then
          TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
          -- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

          ;
          (bm.trigger_sig)("RawSocketOpen", l_0_3)
          -- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

          ;
          (bm.add_related_file)(l_0_3)
          addRelatedProcess()
          reportRelatedBmHits()
          return mp.INFECTED
        end
        return mp.CLEAN
      end
    end
  end
end

