-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b5b3eafbedd7\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched then
    local l_0_0, l_0_2, l_0_3, l_0_5 = nil, nil
  end
  if (this_sigattrlog[5]).matched then
    local l_0_1 = nil
  else
    do
      -- DECOMPILER ERROR at PC24: Overwrote pending register: R1 in 'AssignReg'

      -- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

      do
        if not (this_sigattrlog[6]).matched or (this_sigattrlog[7]).matched then
          local l_0_4, l_0_6 = , (this_sigattrlog[5]).utf8p2
        end
        -- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

        -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

        -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

        if l_0_4 ~= nil and l_0_6 ~= nil then
          local l_0_7 = nil
          -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC51: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

          -- DECOMPILER ERROR at PC59: Confused about usage of register: R2 in 'UnsetPending'

          -- DECOMPILER ERROR at PC64: Confused about usage of register: R2 in 'UnsetPending'

          if ((((l_0_6:match("+x [\"]*([^\"]+)") ~= nil and l_0_6:match("+x [\"]*([^\"]+)") ~= "") or l_0_6:match("777 [\"]*([^\"]+)") ~= nil) and l_0_6:match("777 [\"]*([^\"]+)") ~= "") or l_0_6:match("755 [\"]*([^\"]+)") ~= nil) and l_0_6:match("755 [\"]*([^\"]+)") ~= "" and (string.find)(l_0_7, l_0_6:match("755 [\"]*([^\"]+)"), 1, true) then
            TrackPidAndTechniqueBM("BM", "T1222.002", "DefenseEvasion_FileAndDirectoryPermissionsModification_Curl")
            local l_0_8 = nil
            -- DECOMPILER ERROR at PC82: Confused about usage of register: R3 in 'UnsetPending'

            -- DECOMPILER ERROR at PC84: Confused about usage of register: R2 in 'UnsetPending'

            if (this_sigattrlog[4]).ppid then
              (MpCommon.BmTriggerSig)((this_sigattrlog[4]).ppid, "BM_C2CurlChmodFile", l_0_6:match("755 [\"]*([^\"]+)"))
            end
            return mp.INFECTED
          end
        end
        do
          return mp.CLEAN
        end
      end
    end
  end
end

