-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3c0b34b65188b\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC6: Overwrote pending register: R1 in 'AssignReg'

if (this_sigattrlog[3]).matched then
  local l_0_1 = nil
  local l_0_0 = nil
else
  do
    -- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

    if (this_sigattrlog[4]).matched then
      local l_0_2, l_0_3 = l_0_1, "T1003.003"
    else
      do
        if (this_sigattrlog[5]).matched then
          local l_0_4 = nil
        else
          do
            -- DECOMPILER ERROR at PC33: Overwrote pending register: R1 in 'AssignReg'

            -- DECOMPILER ERROR at PC34: Overwrote pending register: R0 in 'AssignReg'

            if (this_sigattrlog[6]).matched then
              local l_0_5, l_0_6 = l_0_4, "T1003.003"
            else
              do
                if (this_sigattrlog[7]).matched then
                  local l_0_7 = nil
                else
                  do
                    -- DECOMPILER ERROR at PC51: Overwrote pending register: R1 in 'AssignReg'

                    -- DECOMPILER ERROR at PC52: Overwrote pending register: R0 in 'AssignReg'

                    if (this_sigattrlog[8]).matched then
                      local l_0_8, l_0_9 = l_0_7, "T1098"
                    else
                      do
                        if (this_sigattrlog[9]).matched then
                          local l_0_10 = nil
                        else
                          do
                            -- DECOMPILER ERROR at PC69: Overwrote pending register: R1 in 'AssignReg'

                            -- DECOMPILER ERROR at PC70: Overwrote pending register: R0 in 'AssignReg'

                            if (this_sigattrlog[10]).matched then
                              local l_0_11, l_0_12 = l_0_10, "T1197"
                            else
                              do
                                if (this_sigattrlog[11]).matched then
                                  local l_0_13, l_0_16 = , "T1018"
                                  l_0_13 = "nltest_dclist"
                                else
                                  do
                                    do
                                      if (this_sigattrlog[12]).matched then
                                        local l_0_14, l_0_15 = "nltest_trusts", "T1482"
                                      end
                                      -- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

                                      if isnull(l_0_14) then
                                        return mp.CLEAN
                                      end
                                      local l_0_17 = nil
                                      if isnull((bm.get_imagepath)()) then
                                        return mp.CLEAN
                                      end
                                      if not (string.find)((string.lower)((bm.get_imagepath)()), "\\wsmprovhost.exe", 1, true) then
                                        return mp.CLEAN
                                      end
                                      ;
                                      (bm.add_related_string)("winrm_lateral_primitive", l_0_17, bm.RelatedStringBMReport)
                                      ;
                                      (bm.add_related_string)("winrm_remote_host", "wsmprovhost", bm.RelatedStringBMReport)
                                      TrackPidAndTechniqueBM("BM", "T1021.006", "SuspWinRMLateralToolingChild")
                                      -- DECOMPILER ERROR at PC146: Confused about usage of register: R1 in 'UnsetPending'

                                      TrackPidAndTechniqueBM("BM", l_0_15, "SuspWinRMLateralToolingChild")
                                      return mp.INFECTED
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

