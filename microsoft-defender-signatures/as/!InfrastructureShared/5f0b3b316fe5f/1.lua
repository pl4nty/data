local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L5_1 = L5_1.utf8p1
    L4_1 = L4_1(L5_1)
    L1_1 = L4_1
    L4_1 = string
    L4_1 = L4_1.match
    L5_1 = L1_1
    L6_1 = "\\([^\\]+)$"
    L4_1 = L4_1(L5_1, L6_1)
    L0_1 = L4_1
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[1]
    L5_1 = L5_1.utf8p2
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L2_1 = L4_1.ppid
  end
end
if L1_1 == nil or L0_1 == nil or L2_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = {}
L6_1 = "T1547.001"
L7_1 = nil
L8_1 = nil
L9_1 = true
L10_1 = this_sigattrlog
L10_1 = L10_1[2]
L10_1 = L10_1.matched
if L10_1 then
  L10_1 = this_sigattrlog
  L10_1 = L10_1[2]
  L10_1 = L10_1.utf8p2
  if L10_1 ~= nil then
    L10_1 = this_sigattrlog
    L10_1 = L10_1[2]
    L4_1 = L10_1.utf8p2
    L7_1 = "reg_run"
end
else
  L10_1 = this_sigattrlog
  L10_1 = L10_1[3]
  L10_1 = L10_1.matched
  if L10_1 then
    L10_1 = this_sigattrlog
    L10_1 = L10_1[3]
    L10_1 = L10_1.utf8p2
    if L10_1 ~= nil then
      L10_1 = this_sigattrlog
      L10_1 = L10_1[3]
      L4_1 = L10_1.utf8p2
      L7_1 = "reg_runonce"
  end
  else
    L10_1 = this_sigattrlog
    L10_1 = L10_1[4]
    L10_1 = L10_1.matched
    if L10_1 then
      L10_1 = this_sigattrlog
      L10_1 = L10_1[4]
      L10_1 = L10_1.utf8p2
      if L10_1 ~= nil then
        L10_1 = this_sigattrlog
        L10_1 = L10_1[4]
        L4_1 = L10_1.utf8p2
        L7_1 = "reg_runonceex"
    end
    else
      L10_1 = this_sigattrlog
      L10_1 = L10_1[5]
      L10_1 = L10_1.matched
      if L10_1 then
        L10_1 = this_sigattrlog
        L10_1 = L10_1[5]
        L10_1 = L10_1.utf8p2
        if L10_1 ~= nil then
          L10_1 = this_sigattrlog
          L10_1 = L10_1[5]
          L4_1 = L10_1.utf8p2
          L7_1 = "reg_runservices"
      end
      else
        L10_1 = this_sigattrlog
        L10_1 = L10_1[6]
        L10_1 = L10_1.matched
        if L10_1 then
          L10_1 = this_sigattrlog
          L10_1 = L10_1[6]
          L10_1 = L10_1.utf8p2
          if L10_1 ~= nil then
            L10_1 = this_sigattrlog
            L10_1 = L10_1[6]
            L4_1 = L10_1.utf8p2
            L7_1 = "reg_runservicesonce"
        end
        else
          L10_1 = this_sigattrlog
          L10_1 = L10_1[7]
          L10_1 = L10_1.matched
          if L10_1 then
            L10_1 = this_sigattrlog
            L10_1 = L10_1[7]
            L10_1 = L10_1.utf8p2
            if L10_1 ~= nil then
              L10_1 = this_sigattrlog
              L10_1 = L10_1[7]
              L4_1 = L10_1.utf8p2
              L7_1 = "reg_explorer_run"
          end
          else
            L10_1 = this_sigattrlog
            L10_1 = L10_1[8]
            L10_1 = L10_1.matched
            if L10_1 then
              L10_1 = this_sigattrlog
              L10_1 = L10_1[8]
              L10_1 = L10_1.utf8p2
              if L10_1 ~= nil then
                L10_1 = this_sigattrlog
                L10_1 = L10_1[8]
                L4_1 = L10_1.utf8p2
                L7_1 = "reg_winlogon_shell"
                L6_1 = "T1547.004"
                L10_1 = table
                L10_1 = L10_1.insert
                L11_1 = L5_1
                L12_1 = "BM_MT1547.001:persistence"
                L10_1(L11_1, L12_1)
            end
            else
              L10_1 = this_sigattrlog
              L10_1 = L10_1[9]
              L10_1 = L10_1.matched
              if L10_1 then
                L10_1 = this_sigattrlog
                L10_1 = L10_1[9]
                L10_1 = L10_1.utf8p2
                if L10_1 ~= nil then
                  L10_1 = this_sigattrlog
                  L10_1 = L10_1[9]
                  L4_1 = L10_1.utf8p2
                  L7_1 = "reg_winlogon_userinit"
                  L6_1 = "T1547.004"
                  L10_1 = table
                  L10_1 = L10_1.insert
                  L11_1 = L5_1
                  L12_1 = "BM_MT1547.001:persistence"
                  L10_1(L11_1, L12_1)
              end
              else
                L10_1 = this_sigattrlog
                L10_1 = L10_1[10]
                L10_1 = L10_1.matched
                if L10_1 then
                  L10_1 = this_sigattrlog
                  L10_1 = L10_1[10]
                  L10_1 = L10_1.utf8p2
                  if L10_1 ~= nil then
                    L10_1 = this_sigattrlog
                    L10_1 = L10_1[10]
                    L4_1 = L10_1.utf8p2
                    L7_1 = "reg_windows_load"
                end
                else
                  L10_1 = this_sigattrlog
                  L10_1 = L10_1[11]
                  L10_1 = L10_1.matched
                  if L10_1 then
                    L10_1 = this_sigattrlog
                    L10_1 = L10_1[11]
                    L10_1 = L10_1.utf8p2
                    if L10_1 ~= nil then
                      L10_1 = this_sigattrlog
                      L10_1 = L10_1[11]
                      L4_1 = L10_1.utf8p2
                      L7_1 = "reg_winlogon_notify"
                      L6_1 = "T1547.004"
                  end
                  else
                    L10_1 = this_sigattrlog
                    L10_1 = L10_1[12]
                    L10_1 = L10_1.matched
                    if L10_1 then
                      L10_1 = this_sigattrlog
                      L10_1 = L10_1[12]
                      L10_1 = L10_1.p2
                      if L10_1 ~= nil then
                        L10_1 = normalize_unicode
                        L11_1 = this_sigattrlog
                        L11_1 = L11_1[2]
                        L11_1 = L11_1.p2
                        L10_1 = L10_1(L11_1)
                        L4_1 = L10_1
                        L7_1 = "reg_tasks_actions"
                        L6_1 = "T1053.002"
                        L9_1 = false
                        L10_1 = {}
                        L10_1["svchost.exe"] = true
                        L10_1["schtasks.exe"] = true
                        L8_1 = L10_1
                    end
                    else
                      L10_1 = mp
                      L10_1 = L10_1.CLEAN
                      return L10_1
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
if L4_1 ~= nil then
  L10_1 = #L4_1
  if not (L10_1 <= 0) then
    goto lbl_246
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
do return L10_1 end
::lbl_246::
L10_1 = get_filepaths_from_string
L11_1 = string
L11_1 = L11_1.lower
L12_1 = L4_1
L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L11_1(L12_1)
L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
if L10_1 == nil then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = "BM_M"
L12_1 = L6_1
L11_1 = L11_1 .. L12_1
L12_1 = table
L12_1 = L12_1.insert
L13_1 = L5_1
L14_1 = L11_1
L12_1(L13_1, L14_1)
L12_1 = table
L12_1 = L12_1.insert
L13_1 = L5_1
L14_1 = L11_1
L15_1 = ":persistence_target"
L14_1 = L14_1 .. L15_1
L12_1(L13_1, L14_1)
L12_1 = table
L12_1 = L12_1.insert
L13_1 = L5_1
L14_1 = L11_1
L15_1 = ":sourcefilename_"
L16_1 = L0_1
L14_1 = L14_1 .. L15_1 .. L16_1
L12_1(L13_1, L14_1)
L12_1 = table
L12_1 = L12_1.insert
L13_1 = L5_1
L14_1 = L11_1
L15_1 = ":sourceppid_"
L16_1 = L2_1
L14_1 = L14_1 .. L15_1 .. L16_1
L12_1(L13_1, L14_1)
L12_1 = string
L12_1 = L12_1.lower
L13_1 = L0_1
L12_1 = L12_1(L13_1)
if L12_1 == "reg.exe" then
  L12_1 = string
  L12_1 = L12_1.find
  L13_1 = L3_1
  L14_1 = " add "
  L15_1 = 1
  L16_1 = true
  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
  if L12_1 then
    L12_1 = table
    L12_1 = L12_1.insert
    L13_1 = L5_1
    L14_1 = L11_1
    L15_1 = ":source_reg_add"
    L14_1 = L14_1 .. L15_1
    L12_1(L13_1, L14_1)
  end
end
if L7_1 ~= nil then
  L12_1 = #L7_1
  if 0 < L12_1 then
    L12_1 = table
    L12_1 = L12_1.insert
    L13_1 = L5_1
    L14_1 = L11_1
    L15_1 = ":"
    L16_1 = L7_1
    L14_1 = L14_1 .. L15_1 .. L16_1
    L12_1(L13_1, L14_1)
  end
end
if L9_1 == true then
  L12_1 = string
  L12_1 = L12_1.find
  L13_1 = L4_1
  L14_1 = " "
  L15_1 = 1
  L16_1 = true
  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
  if L12_1 then
    L12_1 = TrackCommandLineAndTechnique
    L13_1 = L4_1
    L14_1 = L5_1
    L12_1(L13_1, L14_1)
    L12_1 = TrackCommandLineAndTechnique
    L13_1 = L4_1
    L14_1 = L11_1
    L15_1 = ":track_cmdline"
    L14_1 = L14_1 .. L15_1
    L12_1(L13_1, L14_1)
  end
end
L12_1 = false
L13_1 = ipairs
L14_1 = L10_1
L13_1, L14_1, L15_1 = L13_1(L14_1)
for L16_1, L17_1 in L13_1, L14_1, L15_1 do
  L18_1 = string
  L18_1 = L18_1.sub
  L19_1 = L17_1
  L20_1 = 1
  L21_1 = 1
  L18_1 = L18_1(L19_1, L20_1, L21_1)
  if L18_1 == "%" then
    L18_1 = mp
    L18_1 = L18_1.ContextualExpandEnvironmentVariables
    L19_1 = L17_1
    L18_1 = L18_1(L19_1)
    L17_1 = L18_1
  end
  L18_1 = isLolbinFile
  L19_1 = L17_1
  L18_1 = L18_1(L19_1)
  if L18_1 == false then
    L18_1 = MpCommon
    L18_1 = L18_1.QueryPersistContext
    L19_1 = L17_1
    L20_1 = "RegistryValueDataToFilePersistContext.A"
    L18_1 = L18_1(L19_1, L20_1)
    if not L18_1 then
      L18_1 = sysio
      L18_1 = L18_1.IsFileExists
      L19_1 = L17_1
      L18_1 = L18_1(L19_1)
      if L18_1 then
        L18_1 = MpCommon
        L18_1 = L18_1.AppendPersistContext
        L19_1 = L17_1
        L20_1 = "RegistryValueDataToFilePersistContext.A"
        L21_1 = 0
        L18_1(L19_1, L20_1, L21_1)
        L18_1 = appendFilePersistContextFromList
        L19_1 = L17_1
        L20_1 = L5_1
        L18_1 = L18_1(L19_1, L20_1)
        L12_1 = L18_1
      end
    end
  end
end
if L12_1 == false then
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
if L8_1 ~= nil then
  L13_1 = type
  L14_1 = L8_1
  L13_1 = L13_1(L14_1)
  if L13_1 ~= "table" then
    goto lbl_418
  end
  L13_1 = L8_1[L0_1]
  if L13_1 ~= nil then
    goto lbl_418
  end
end
L13_1 = TrackPidAndTechniqueBM
L14_1 = L2_1
L15_1 = L6_1
L16_1 = "persistence_source"
L13_1(L14_1, L15_1, L16_1)
L13_1 = TrackPidAndTechniqueBM
L14_1 = L2_1
L15_1 = L6_1
L16_1 = L7_1
L13_1(L14_1, L15_1, L16_1)
::lbl_418::
L13_1 = MpCommon
L13_1 = L13_1.QueryPersistContext
L14_1 = L1_1
L15_1 = "RegistryValueDataToFilePersistContext.A"
L13_1 = L13_1(L14_1, L15_1)
if not L13_1 then
  L13_1 = isLolbinFile
  L14_1 = L1_1
  L13_1 = L13_1(L14_1)
  if L13_1 == false then
    L13_1 = MpCommon
    L13_1 = L13_1.AppendPersistContext
    L14_1 = L1_1
    L15_1 = "RegistryValueDataToFilePersistContext.A"
    L16_1 = 0
    L13_1(L14_1, L15_1, L16_1)
    L13_1 = L11_1
    L14_1 = ":persistence_source"
    L13_1 = L13_1 .. L14_1
    L14_1 = appendNotExistingFilePersistContext
    L15_1 = L1_1
    L16_1 = L13_1
    L14_1(L15_1, L16_1)
  end
end
L13_1 = mp
L13_1 = L13_1.INFECTED
return L13_1
