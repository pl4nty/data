-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\555b3c14c6bf6\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2] == nil or not (this_sigattrlog[2]).matched) and (this_sigattrlog[3] == nil or not (this_sigattrlog[3]).matched) then
  return mp.CLEAN
end
if IsTrustedWinRMSession("BM") then
  return mp.CLEAN
end
local l_0_0 = "PSRemoting"
if this_sigattrlog[3] ~= nil and (this_sigattrlog[3]).matched then
  l_0_0 = "WinRS"
end
WinRMSessionTrackProcess("BM", l_0_0, "HostedShell")
local l_0_1, l_0_2, l_0_3 = nil, nil, nil
if this_sigattrlog[20] and (this_sigattrlog[20]).matched then
  l_0_1 = this_sigattrlog[20]
else
  -- DECOMPILER ERROR at PC74: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R2 in 'AssignReg'

  if this_sigattrlog[16] and (this_sigattrlog[16]).matched then
    l_0_1 = this_sigattrlog[16]
  else
    -- DECOMPILER ERROR at PC90: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC91: Overwrote pending register: R2 in 'AssignReg'

    if this_sigattrlog[17] and (this_sigattrlog[17]).matched then
      l_0_1 = this_sigattrlog[17]
    else
      -- DECOMPILER ERROR at PC106: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC107: Overwrote pending register: R2 in 'AssignReg'

      if this_sigattrlog[18] and (this_sigattrlog[18]).matched then
        l_0_1 = this_sigattrlog[18]
      else
        -- DECOMPILER ERROR at PC122: Overwrote pending register: R3 in 'AssignReg'

        -- DECOMPILER ERROR at PC123: Overwrote pending register: R2 in 'AssignReg'

        if this_sigattrlog[19] and (this_sigattrlog[19]).matched then
          l_0_1 = this_sigattrlog[19]
        else
          -- DECOMPILER ERROR at PC138: Overwrote pending register: R3 in 'AssignReg'

          -- DECOMPILER ERROR at PC139: Overwrote pending register: R2 in 'AssignReg'

          if this_sigattrlog[4] and (this_sigattrlog[4]).matched then
            l_0_1 = this_sigattrlog[4]
          else
            -- DECOMPILER ERROR at PC154: Overwrote pending register: R3 in 'AssignReg'

            -- DECOMPILER ERROR at PC155: Overwrote pending register: R2 in 'AssignReg'

            if this_sigattrlog[5] and (this_sigattrlog[5]).matched then
              l_0_1 = this_sigattrlog[5]
            else
              -- DECOMPILER ERROR at PC170: Overwrote pending register: R3 in 'AssignReg'

              -- DECOMPILER ERROR at PC171: Overwrote pending register: R2 in 'AssignReg'

              if this_sigattrlog[6] and (this_sigattrlog[6]).matched then
                l_0_1 = this_sigattrlog[6]
              else
                -- DECOMPILER ERROR at PC186: Overwrote pending register: R3 in 'AssignReg'

                -- DECOMPILER ERROR at PC187: Overwrote pending register: R2 in 'AssignReg'

                if this_sigattrlog[7] and (this_sigattrlog[7]).matched then
                  l_0_1 = this_sigattrlog[7]
                else
                  -- DECOMPILER ERROR at PC202: Overwrote pending register: R3 in 'AssignReg'

                  -- DECOMPILER ERROR at PC203: Overwrote pending register: R2 in 'AssignReg'

                  if this_sigattrlog[8] and (this_sigattrlog[8]).matched then
                    l_0_1 = this_sigattrlog[8]
                  else
                    -- DECOMPILER ERROR at PC218: Overwrote pending register: R3 in 'AssignReg'

                    -- DECOMPILER ERROR at PC219: Overwrote pending register: R2 in 'AssignReg'

                    if this_sigattrlog[9] and (this_sigattrlog[9]).matched then
                      l_0_1 = this_sigattrlog[9]
                    else
                      -- DECOMPILER ERROR at PC234: Overwrote pending register: R3 in 'AssignReg'

                      -- DECOMPILER ERROR at PC235: Overwrote pending register: R2 in 'AssignReg'

                      if this_sigattrlog[10] and (this_sigattrlog[10]).matched then
                        l_0_1 = this_sigattrlog[10]
                      else
                        -- DECOMPILER ERROR at PC250: Overwrote pending register: R3 in 'AssignReg'

                        -- DECOMPILER ERROR at PC251: Overwrote pending register: R2 in 'AssignReg'

                        if this_sigattrlog[11] and (this_sigattrlog[11]).matched then
                          l_0_1 = this_sigattrlog[11]
                        else
                          -- DECOMPILER ERROR at PC266: Overwrote pending register: R3 in 'AssignReg'

                          -- DECOMPILER ERROR at PC267: Overwrote pending register: R2 in 'AssignReg'

                          if this_sigattrlog[12] and (this_sigattrlog[12]).matched then
                            l_0_1 = this_sigattrlog[12]
                          else
                            -- DECOMPILER ERROR at PC282: Overwrote pending register: R3 in 'AssignReg'

                            -- DECOMPILER ERROR at PC283: Overwrote pending register: R2 in 'AssignReg'

                            if this_sigattrlog[13] and (this_sigattrlog[13]).matched then
                              l_0_1 = this_sigattrlog[13]
                            else
                              -- DECOMPILER ERROR at PC298: Overwrote pending register: R3 in 'AssignReg'

                              -- DECOMPILER ERROR at PC299: Overwrote pending register: R2 in 'AssignReg'

                              if this_sigattrlog[14] and (this_sigattrlog[14]).matched then
                                l_0_1 = this_sigattrlog[14]
                              else
                                -- DECOMPILER ERROR at PC314: Overwrote pending register: R3 in 'AssignReg'

                                -- DECOMPILER ERROR at PC315: Overwrote pending register: R2 in 'AssignReg'

                                if this_sigattrlog[15] and (this_sigattrlog[15]).matched then
                                  l_0_1 = this_sigattrlog[15]
                                else
                                  -- DECOMPILER ERROR at PC330: Overwrote pending register: R3 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC331: Overwrote pending register: R2 in 'AssignReg'

                                  if this_sigattrlog[22] and (this_sigattrlog[22]).matched then
                                    l_0_1 = this_sigattrlog[22]
                                  else
                                    -- DECOMPILER ERROR at PC346: Overwrote pending register: R3 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC347: Overwrote pending register: R2 in 'AssignReg'

                                    if this_sigattrlog[23] and (this_sigattrlog[23]).matched then
                                      l_0_1 = this_sigattrlog[23]
                                    else
                                      -- DECOMPILER ERROR at PC362: Overwrote pending register: R3 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC363: Overwrote pending register: R2 in 'AssignReg'

                                      if this_sigattrlog[24] and (this_sigattrlog[24]).matched then
                                        l_0_1 = this_sigattrlog[24]
                                      else
                                        -- DECOMPILER ERROR at PC378: Overwrote pending register: R3 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC379: Overwrote pending register: R2 in 'AssignReg'

                                        if this_sigattrlog[25] and (this_sigattrlog[25]).matched then
                                          l_0_1 = this_sigattrlog[25]
                                        else
                                          -- DECOMPILER ERROR at PC394: Overwrote pending register: R3 in 'AssignReg'

                                          -- DECOMPILER ERROR at PC395: Overwrote pending register: R2 in 'AssignReg'

                                          if this_sigattrlog[21] and (this_sigattrlog[21]).matched then
                                            l_0_1 = this_sigattrlog[21]
                                          else
                                            return mp.CLEAN
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
    end
  end
end
local l_0_4 = l_0_1.utf8p1
do
  if not isnull(l_0_4) then
    local l_0_5 = (string.lower)(l_0_4)
    if (string.find)(l_0_5, "\\windows\\ccm\\", 1, true) or (string.find)(l_0_5, "\\intunemanagementextension\\", 1, true) or (string.find)(l_0_5, "\\ansible\\", 1, true) or (string.find)(l_0_5, "\\windows defender\\", 1, true) or (string.find)(l_0_5, "__psscriptpolicytest_", 1, true) then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("WinRMHost_artifact", l_0_5, bm.RelatedStringBMReport)
    if (string.find)(l_0_2, "host_drop", 1, true) or (string.find)(l_0_2, "host_load", 1, true) then
      (bm.add_related_file)(l_0_4)
      WinRMSessionTrackFile(l_0_4, l_0_0, "DeliveredFile")
      ;
      (mp.set_mpattribute)("Lua:Context/WinRMSessionDroppedFile.A")
    end
  end
  ;
  (bm.add_related_string)("WinRMHost_reason", l_0_2, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMHost_tool", l_0_0, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("winrm_context", "WinRMSessionTracking", bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMHostActivity")
  TrackPidAndTechniqueBM("BM", l_0_3, "WinRMHostActivity")
  add_parents()
  return mp.INFECTED
end

