-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3abb3072b2908\0x00000c8b_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC23: Overwrote pending register: R0 in 'AssignReg'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[3]).matched then
      local l_0_1 = (this_sigattrlog[2]).utf8p1
    end
    -- DECOMPILER ERROR at PC39: Overwrote pending register: R0 in 'AssignReg'

    do
      if not (this_sigattrlog[4]).matched or (this_sigattrlog[5]).matched then
        local l_0_2 = (this_sigattrlog[4]).utf8p1
      end
      -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

      do
        if not (this_sigattrlog[6]).matched or (this_sigattrlog[7]).matched then
          local l_0_3 = (this_sigattrlog[6]).utf8p1
        end
        -- DECOMPILER ERROR at PC71: Overwrote pending register: R0 in 'AssignReg'

        do
          if not (this_sigattrlog[8]).matched or (this_sigattrlog[9]).matched then
            local l_0_4 = (this_sigattrlog[8]).utf8p1
          end
          -- DECOMPILER ERROR at PC87: Overwrote pending register: R0 in 'AssignReg'

          do
            if not (this_sigattrlog[10]).matched or (this_sigattrlog[11]).matched then
              local l_0_5, l_0_6, l_0_7, l_0_8, l_0_9 = (this_sigattrlog[10]).utf8p1
            end
            if (this_sigattrlog[12]).matched then
              (bm.add_related_file)((this_sigattrlog[12]).utf8p1)
              local l_0_10 = nil
              local l_0_11 = {}
              l_0_11.friendly = (MpCommon.IsFriendlyProcess)(((bm.get_current_process_startup_info)()).ppid)
              local l_0_12 = nil
              l_0_11.parents = (bm.get_process_relationships)()
              local l_0_13 = getCurrentProcessInjectors()
              l_0_11.injected = R5_PC117
              l_0_11.injectors = ((bm.get_current_process_startup_info)()).ppid
              l_0_11.injection_relationship = l_0_13
              l_0_13 = safeJsonSerialize
              l_0_13 = l_0_13(l_0_11)
              l_0_11 = l_0_13
              l_0_13 = bm
              l_0_13 = l_0_13.add_related_string
              l_0_13("TelemetryData", R5_PC117, bm.RelatedStringBMReport)
              l_0_13 = versioning
              l_0_13 = l_0_13.IsSeville
              l_0_13 = l_0_13()
              if l_0_13 then
                l_0_13 = l_0_11.friendly
                if not l_0_13 then
                  l_0_13 = bm
                  l_0_13 = l_0_13.trigger_sig
                  -- DECOMPILER ERROR at PC142: Overwrote pending register: R5 in 'AssignReg'

                  l_0_13("UEFILogo.D", R5_PC117)
                end
              end
              l_0_13 = mp
              l_0_13 = l_0_13.INFECTED
              return l_0_13
            end
          end
        end
      end
    end
  end
end

