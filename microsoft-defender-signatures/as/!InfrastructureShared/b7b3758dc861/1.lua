local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1
L0_1 = 0
L1_1 = {}
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p2
    if not L3_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L2_1
    L4_1 = L4_1(L5_1)
    L2_1 = L4_1
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    if L3_1 == L2_1 or L3_1 == "" then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "script:"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L0_1 = L0_1 + 500
      L1_1.new_value = L3_1
      L1_1.old_value = L2_1
    else
      L4_1 = isSimilarPath
      L5_1 = L3_1
      L6_1 = L2_1
      L7_1 = 80
      L8_1 = 3
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.CLEAN
        return L4_1
      else
        L4_1 = string
        L4_1 = L4_1.match
        L5_1 = L3_1
        L6_1 = "%w:\\.*.exe"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.match
          L5_1 = L3_1
          L6_1 = "%w:\\.*.dll"
          L4_1 = L4_1(L5_1, L6_1)
        end
        L5_1 = string
        L5_1 = L5_1.match
        L6_1 = L2_1
        L7_1 = "%w:\\.*.exe"
        L5_1 = L5_1(L6_1, L7_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.match
          L6_1 = L2_1
          L7_1 = "%w:\\.*.dll"
          L5_1 = L5_1(L6_1, L7_1)
        end
        L1_1.new_value = L4_1
        L1_1.old_value = L5_1
        if L2_1 ~= "" and L4_1 and L5_1 then
          L6_1 = string
          L6_1 = L6_1.match
          L7_1 = L4_1
          L8_1 = "([^\\]+)$"
          L6_1 = L6_1(L7_1, L8_1)
          L7_1 = string
          L7_1 = L7_1.match
          L8_1 = L5_1
          L9_1 = "([^\\]+)$"
          L7_1 = L7_1(L8_1, L9_1)
          if L6_1 ~= L7_1 then
            L0_1 = L0_1 + 10
          end
        end
        L6_1 = string
        L6_1 = L6_1.gsub
        L7_1 = L4_1
        L8_1 = "\\"
        L9_1 = "\\\\"
        L6_1 = L6_1(L7_1, L8_1, L9_1)
        L8_1 = L6_1
        L7_1 = L6_1.gsub
        L9_1 = "([%^%$%(%)%.%[%]%*%+%-%?])"
        L10_1 = "\\%1"
        L7_1 = L7_1(L8_1, L9_1, L10_1)
        L6_1 = L7_1
        L7_1 = pcall
        L8_1 = MpCommon
        L8_1 = L8_1.RollingQueueQueryKeyRegex
        L9_1 = "RQ_RecentExecDropped_MultipleKey_30m"
        L10_1 = L6_1
        L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1)
        if L7_1 and L8_1 then
          L9_1 = L8_1.value
          if L9_1 then
            L9_1 = {}
            L10_1 = L8_1
            L9_1[1] = L10_1
            L8_1 = L9_1
          end
          L1_1.FileDroppedRecently = true
          L1_1.FileInfo = L8_1
          L9_1 = ipairs
          L10_1 = L8_1
          L9_1, L10_1, L11_1 = L9_1(L10_1)
          for L12_1, L13_1 in L9_1, L10_1, L11_1 do
            L14_1 = string
            L14_1 = L14_1.find
            L15_1 = L13_1.value
            L16_1 = "UnsignedFile"
            L17_1 = 1
            L18_1 = true
            L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
            if L14_1 then
              L14_1 = string
              L14_1 = L14_1.match
              L15_1 = L13_1.value
              L16_1 = "Process_Img(.*)"
              L14_1 = L14_1(L15_1, L16_1)
              if L14_1 then
                L15_1 = contains
                L16_1 = L14_1
                L17_1 = {}
                L18_1 = "explorer.exe"
                L19_1 = "WinRAR.exe"
                L20_1 = "7z.exe"
                L17_1[1] = L18_1
                L17_1[2] = L19_1
                L17_1[3] = L20_1
                L15_1 = L15_1(L16_1, L17_1)
                if L15_1 then
                  L0_1 = L0_1 + 20
                end
              end
              L15_1 = MpCommon
              L15_1 = L15_1.StringRegExpSearch
              L16_1 = "\\\\(desktop|download|onedrive|document|picture)"
              L17_1 = L13_1.key
              L15_1 = L15_1(L16_1, L17_1)
              if L15_1 then
                L0_1 = L0_1 + 50
              end
              L15_1 = string
              L15_1 = L15_1.find
              L16_1 = L13_1.value
              L17_1 = "FileAttributes"
              L18_1 = 1
              L19_1 = true
              L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
              if L15_1 then
                L15_1 = string
                L15_1 = L15_1.match
                L16_1 = L13_1.value
                L17_1 = "%[(.*)%]"
                L15_1 = L15_1(L16_1, L17_1)
                L16_1 = string
                L16_1 = L16_1.gmatch
                L17_1 = L15_1
                L18_1 = "([^|]+)"
                L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1)
                for L19_1 in L16_1, L17_1, L18_1 do
                  L20_1 = string
                  L20_1 = L20_1.find
                  L21_1 = L19_1
                  L22_1 = "Aurora.A!rfn"
                  L23_1 = 1
                  L24_1 = true
                  L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1)
                  if not L20_1 then
                    L0_1 = L0_1 + 5
                  end
                  if L19_1 == "SLF:HighRiskHasMotW" then
                    L0_1 = L0_1 + 100
                  end
                end
              end
              break
            end
          end
        else
          L9_1 = mp
          L9_1 = L9_1.CLEAN
          return L9_1
        end
      end
    end
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.utf8p1
    L6_1 = "HKCU\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = string
      L4_1 = L4_1.gsub
      L5_1 = this_sigattrlog
      L5_1 = L5_1[2]
      L5_1 = L5_1.utf8p1
      L6_1 = "HKCU\\"
      L7_1 = "HKLM\\"
      L4_1 = L4_1(L5_1, L6_1, L7_1)
      L5_1 = GetRegistryValue
      L6_1 = L4_1
      L7_1 = ""
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        L5_1 = ""
      end
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      L5_1 = L6_1
      if L5_1 ~= L3_1 then
        L6_1 = isSimilarPath
        L7_1 = L3_1
        L8_1 = L5_1
        L9_1 = 80
        L10_1 = 3
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L0_1 = L0_1 + 10
          L1_1.hklm_value = L5_1
        end
      end
    end
    L4_1 = false
    if 500 <= L0_1 then
      L5_1 = bm
      L5_1 = L5_1.get_current_process_startup_info
      L5_1 = L5_1()
      if L5_1 then
        L6_1 = L5_1.ppid
        if L6_1 then
          L6_1 = bm
          L6_1 = L6_1.get_imagepath
          L6_1 = L6_1()
          if not L6_1 then
            L6_1 = ""
          end
          L7_1 = mp
          L7_1 = L7_1.GetProcessCommandLine
          L8_1 = L5_1.ppid
          L7_1 = L7_1(L8_1)
          if not L7_1 then
            L7_1 = ""
          end
          L8_1 = contains
          L9_1 = L6_1
          L10_1 = "reg.exe"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 then
            L8_1 = contains
            L9_1 = L7_1
            L10_1 = " add "
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 then
              L4_1 = true
            end
          end
          L8_1 = contains
          L9_1 = L6_1
          L10_1 = "powershell"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 then
            L8_1 = string
            L8_1 = L8_1.gsub
            L9_1 = L7_1
            L10_1 = "%$"
            L11_1 = ""
            L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
            if 6 < L9_1 then
              L4_1 = true
            end
          end
        end
      end
    end
    if 15 < L0_1 then
      L1_1.score = L0_1
      L5_1 = add_parents
      L5_1 = L5_1()
      L1_1.parents = L5_1
      L1_1.should_block = L4_1
      L5_1 = safeJsonSerialize
      L6_1 = L1_1
      L5_1 = L5_1(L6_1)
      L6_1 = bm
      L6_1 = L6_1.add_related_string
      L7_1 = "AdditionalInfo"
      L8_1 = L5_1
      L9_1 = bm
      L9_1 = L9_1.RelatedStringBMReport
      L6_1(L7_1, L8_1, L9_1)
      L6_1 = bm
      L6_1 = L6_1.add_related_file
      L7_1 = L1_1.new_value
      L6_1(L7_1)
      if L4_1 then
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      else
        L6_1 = bm
        L6_1 = L6_1.trigger_sig
        L7_1 = "Susp_TypeLibHijacking"
        L8_1 = L5_1
        L6_1(L7_1, L8_1)
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
