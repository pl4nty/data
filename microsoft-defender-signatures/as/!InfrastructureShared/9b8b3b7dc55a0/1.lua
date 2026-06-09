-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9b8b3b7dc55a0\1.luac 

-- params : ...
-- function num : 0
if (((this_sigattrlog[2] ~= nil and (this_sigattrlog[2]).matched) or (this_sigattrlog[3] ~= nil and (this_sigattrlog[3]).matched) or (this_sigattrlog[4] ~= nil and (this_sigattrlog[4]).matched) or IsWinRMSessionForPpid("BM", nil, nil) or not IsWinRMSessionFoundInParents("BM", nil, 4, nil))) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = nil, nil
if (this_sigattrlog[5]).matched then
  l_0_0 = "reg_save_hive"
else
  -- DECOMPILER ERROR at PC60: Overwrote pending register: R1 in 'AssignReg'

  if (this_sigattrlog[6]).matched then
    l_0_0 = "vssadmin_shadow"
  else
    -- DECOMPILER ERROR at PC69: Overwrote pending register: R1 in 'AssignReg'

    if (this_sigattrlog[7]).matched then
      l_0_0 = "wmic_shadow"
    else
      -- DECOMPILER ERROR at PC78: Overwrote pending register: R1 in 'AssignReg'

      if (this_sigattrlog[8]).matched then
        l_0_0 = "net_user_add"
      else
        -- DECOMPILER ERROR at PC87: Overwrote pending register: R1 in 'AssignReg'

        if (this_sigattrlog[9]).matched then
          l_0_0 = "net_group_admin_add"
        else
          -- DECOMPILER ERROR at PC96: Overwrote pending register: R1 in 'AssignReg'

          if (this_sigattrlog[10]).matched then
            l_0_0 = "psexec_child"
          else
            -- DECOMPILER ERROR at PC105: Overwrote pending register: R1 in 'AssignReg'

            if (this_sigattrlog[11]).matched then
              l_0_0 = "bitsadmin_transfer"
            else
              -- DECOMPILER ERROR at PC114: Overwrote pending register: R1 in 'AssignReg'

              if (this_sigattrlog[12]).matched then
                l_0_0 = "certutil_urlcache"
              else
                -- DECOMPILER ERROR at PC123: Overwrote pending register: R1 in 'AssignReg'

                if (this_sigattrlog[13]).matched then
                  l_0_0 = "nltest_dclist"
                else
                  -- DECOMPILER ERROR at PC132: Overwrote pending register: R1 in 'AssignReg'

                  if (this_sigattrlog[14]).matched then
                    l_0_0 = "nltest_trusts"
                  else
                    -- DECOMPILER ERROR at PC141: Overwrote pending register: R1 in 'AssignReg'

                    if (this_sigattrlog[15]).matched then
                      l_0_0 = "whoami"
                    else
                      -- DECOMPILER ERROR at PC150: Overwrote pending register: R1 in 'AssignReg'

                      if (this_sigattrlog[16]).matched then
                        l_0_0 = "hostname"
                      else
                        -- DECOMPILER ERROR at PC159: Overwrote pending register: R1 in 'AssignReg'

                        if (this_sigattrlog[17]).matched then
                          l_0_0 = "ipconfig"
                        else
                          -- DECOMPILER ERROR at PC168: Overwrote pending register: R1 in 'AssignReg'

                          if (this_sigattrlog[18]).matched then
                            l_0_0 = "systeminfo"
                          else
                            -- DECOMPILER ERROR at PC177: Overwrote pending register: R1 in 'AssignReg'

                            if (this_sigattrlog[19]).matched then
                              l_0_0 = "tasklist"
                            else
                              -- DECOMPILER ERROR at PC186: Overwrote pending register: R1 in 'AssignReg'

                              if (this_sigattrlog[20]).matched then
                                l_0_0 = "netstat"
                              else
                                -- DECOMPILER ERROR at PC195: Overwrote pending register: R1 in 'AssignReg'

                                if (this_sigattrlog[21]).matched then
                                  l_0_0 = "route"
                                else
                                  -- DECOMPILER ERROR at PC204: Overwrote pending register: R1 in 'AssignReg'

                                  if (this_sigattrlog[22]).matched then
                                    l_0_0 = "arp"
                                  else
                                    -- DECOMPILER ERROR at PC213: Overwrote pending register: R1 in 'AssignReg'

                                    if (this_sigattrlog[23]).matched then
                                      l_0_0 = "nslookup"
                                    else
                                      -- DECOMPILER ERROR at PC222: Overwrote pending register: R1 in 'AssignReg'

                                      if (this_sigattrlog[24]).matched then
                                        l_0_0 = "dsquery"
                                      else
                                        -- DECOMPILER ERROR at PC231: Overwrote pending register: R1 in 'AssignReg'

                                        if (this_sigattrlog[25]).matched then
                                          l_0_0 = "quser"
                                        else
                                          -- DECOMPILER ERROR at PC240: Overwrote pending register: R1 in 'AssignReg'

                                          if (this_sigattrlog[26]).matched then
                                            l_0_0 = "query"
                                          else
                                            -- DECOMPILER ERROR at PC249: Overwrote pending register: R1 in 'AssignReg'

                                            if (this_sigattrlog[27]).matched then
                                              l_0_0 = "qwinsta"
                                            else
                                              -- DECOMPILER ERROR at PC258: Overwrote pending register: R1 in 'AssignReg'

                                              if (this_sigattrlog[28]).matched then
                                                l_0_0 = "klist"
                                              else
                                                -- DECOMPILER ERROR at PC267: Overwrote pending register: R1 in 'AssignReg'

                                                if (this_sigattrlog[29]).matched then
                                                  l_0_0 = "cmdkey"
                                                else
                                                  -- DECOMPILER ERROR at PC276: Overwrote pending register: R1 in 'AssignReg'

                                                  if (this_sigattrlog[30]).matched then
                                                    l_0_0 = "cmd"
                                                  else
                                                    -- DECOMPILER ERROR at PC285: Overwrote pending register: R1 in 'AssignReg'

                                                    if (this_sigattrlog[31]).matched then
                                                      l_0_0 = "powershell"
                                                    else
                                                      -- DECOMPILER ERROR at PC294: Overwrote pending register: R1 in 'AssignReg'

                                                      if (this_sigattrlog[32]).matched then
                                                        l_0_0 = "pwsh"
                                                      else
                                                        -- DECOMPILER ERROR at PC303: Overwrote pending register: R1 in 'AssignReg'

                                                        if (this_sigattrlog[33]).matched then
                                                          l_0_0 = "mshta"
                                                        else
                                                          -- DECOMPILER ERROR at PC312: Overwrote pending register: R1 in 'AssignReg'

                                                          if (this_sigattrlog[34]).matched then
                                                            l_0_0 = "rundll32"
                                                          else
                                                            -- DECOMPILER ERROR at PC321: Overwrote pending register: R1 in 'AssignReg'

                                                            if (this_sigattrlog[35]).matched then
                                                              l_0_0 = "regsvr32"
                                                            else
                                                              -- DECOMPILER ERROR at PC330: Overwrote pending register: R1 in 'AssignReg'

                                                              if (this_sigattrlog[36]).matched then
                                                                l_0_0 = "cscript"
                                                              else
                                                                -- DECOMPILER ERROR at PC339: Overwrote pending register: R1 in 'AssignReg'

                                                                if (this_sigattrlog[37]).matched then
                                                                  l_0_0 = "wscript"
                                                                else
                                                                  -- DECOMPILER ERROR at PC348: Overwrote pending register: R1 in 'AssignReg'

                                                                  if (this_sigattrlog[38]).matched then
                                                                    l_0_0 = "schtasks"
                                                                  else
                                                                    -- DECOMPILER ERROR at PC357: Overwrote pending register: R1 in 'AssignReg'

                                                                    if (this_sigattrlog[39]).matched then
                                                                      l_0_0 = "sc"
                                                                    else
                                                                      -- DECOMPILER ERROR at PC366: Overwrote pending register: R1 in 'AssignReg'

                                                                      if (this_sigattrlog[40]).matched then
                                                                        l_0_0 = "wevtutil"
                                                                      else
                                                                        -- DECOMPILER ERROR at PC375: Overwrote pending register: R1 in 'AssignReg'

                                                                        if (this_sigattrlog[41]).matched then
                                                                          l_0_0 = "bcdedit"
                                                                        else
                                                                          -- DECOMPILER ERROR at PC384: Overwrote pending register: R1 in 'AssignReg'

                                                                          if (this_sigattrlog[42]).matched then
                                                                            l_0_0 = "curl"
                                                                          else
                                                                            -- DECOMPILER ERROR at PC393: Overwrote pending register: R1 in 'AssignReg'

                                                                            if (this_sigattrlog[43]).matched then
                                                                              l_0_0 = "wget"
                                                                            else
                                                                              -- DECOMPILER ERROR at PC402: Overwrote pending register: R1 in 'AssignReg'

                                                                              if (this_sigattrlog[44]).matched then
                                                                                l_0_0 = "procdump"
                                                                              else
                                                                                -- DECOMPILER ERROR at PC411: Overwrote pending register: R1 in 'AssignReg'

                                                                                if (this_sigattrlog[45]).matched then
                                                                                  l_0_0 = "comsvcs_minidump"
                                                                                else
                                                                                  -- DECOMPILER ERROR at PC420: Overwrote pending register: R1 in 'AssignReg'

                                                                                  if (this_sigattrlog[46]).matched then
                                                                                    l_0_0 = "robocopy"
                                                                                  else
                                                                                    -- DECOMPILER ERROR at PC429: Overwrote pending register: R1 in 'AssignReg'

                                                                                    if (this_sigattrlog[47]).matched then
                                                                                      l_0_0 = "xcopy"
                                                                                    else
                                                                                      -- DECOMPILER ERROR at PC438: Overwrote pending register: R1 in 'AssignReg'

                                                                                      if (this_sigattrlog[48]).matched then
                                                                                        l_0_0 = "esentutl"
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
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = (bm.get_imagepath)()
if not isnull(l_0_2) then
  (bm.add_related_string)("winrm_lateral_actor", (string.lower)(l_0_2), bm.RelatedStringBMReport)
end
;
(bm.add_related_string)("winrm_lateral_primitive", l_0_0, bm.RelatedStringBMReport)
;
(bm.add_related_string)("winrm_context", "WinRMSessionTracking", bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMLateralToolingChild")
TrackPidAndTechniqueBM("BM", l_0_1, "WinRMLateralToolingChild")
return mp.INFECTED

