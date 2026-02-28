local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[1]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.utf8p2
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "(.*)|(.*)"
    L1_1, L2_1 = L1_1(L2_1, L3_1)
    if not L1_1 or not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    L1_1 = L3_1
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "^(.*)\\"
    L3_1 = L3_1(L4_1, L5_1)
    L5_1 = L2_1
    L4_1 = L2_1.match
    L6_1 = "([^\\]+)$"
    L4_1 = L4_1(L5_1, L6_1)
    L6_1 = L1_1
    L5_1 = L1_1.match
    L7_1 = "([^\\]+)$"
    L5_1 = L5_1(L6_1, L7_1)
    L6_1 = {}
    L6_1.Dll_Path = L2_1
    L7_1 = IsKeyValuePairInRollingQueue
    L8_1 = "ArchivesWithExec_FileName"
    L9_1 = L4_1
    L10_1 = L3_1
    L11_1 = false
    L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    L9_1 = IsKeyValuePairInRollingQueue
    L10_1 = "ArchivesWithExec_FileName"
    L11_1 = L5_1
    L12_1 = L3_1
    L13_1 = false
    L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L7_1 and L9_1 then
      L6_1.DllAndExecInArchive = true
      L6_1.Archive_Exe = L10_1
      L6_1.Archive_Dll = L8_1
    end
    L11_1 = pcall
    L12_1 = MpCommon
    L12_1 = L12_1.RollingQueueQueryKeyRegex
    L13_1 = "RQ_RecentExecDropped"
    L14_1 = L2_1
    L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1)
    if L11_1 and L12_1 then
      L6_1.FileDropperInfo = L12_1
    end
    L13_1 = IsKeyInRollingQueue
    L14_1 = "SYSTEM_DLLs"
    L15_1 = L4_1
    L13_1, L14_1 = L13_1(L14_1, L15_1)
    if L14_1 then
      if L14_1 ~= "NONE" then
        L6_1.POTENTIAL_SIDE_LOADING = L14_1
      end
    else
      L15_1 = "NONE"
      L16_1 = sysio
      L16_1 = L16_1.IsFileExists
      L17_1 = "c:\\Windows\\System32\\"
      L18_1 = L4_1
      L17_1 = L17_1 .. L18_1
      L16_1 = L16_1(L17_1)
      if L16_1 then
        L15_1 = "System32"
        L6_1.POTENTIAL_SIDE_LOADING = "System32"
      else
        L16_1 = sysio
        L16_1 = L16_1.IsFileExists
        L17_1 = "c:\\Windows\\SysWOW64\\"
        L18_1 = L4_1
        L17_1 = L17_1 .. L18_1
        L16_1 = L16_1(L17_1)
        if L16_1 then
          L15_1 = "SysWOW64"
          L6_1.POTENTIAL_SIDE_LOADING = "SysWOW64"
        end
      end
      L16_1 = AppendToRollingQueue
      L17_1 = "SYSTEM_DLLs"
      L18_1 = L4_1
      L19_1 = L15_1
      L20_1 = 31104000
      L21_1 = 1000
      L16_1(L17_1, L18_1, L19_1, L20_1, L21_1)
    end
    L15_1 = safeJsonSerialize
    L16_1 = L6_1
    L17_1 = 100
    L18_1 = nil
    L19_1 = true
    L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
    L16_1 = bm
    L16_1 = L16_1.add_related_string
    L17_1 = "Additional_Info"
    L18_1 = L15_1 or L18_1
    if not L15_1 then
      L18_1 = ""
    end
    L19_1 = bm
    L19_1 = L19_1.RelatedStringBMReport
    L16_1(L17_1, L18_1, L19_1)
    L16_1 = bm
    L16_1 = L16_1.add_related_file
    L17_1 = L2_1
    L16_1(L17_1)
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
