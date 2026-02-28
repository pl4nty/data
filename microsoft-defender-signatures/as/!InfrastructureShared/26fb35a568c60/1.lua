local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = ".sysmain.sdb"
L1_1[1] = L2_1
L2_1 = contains
L3_1 = L0_1.command_line
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L0_1.integrity_level
L3_1 = MpCommon
L3_1 = L3_1.SECURITY_MANDATORY_HIGH_RID
if L2_1 >= L3_1 then
  L2_1 = {}
  L3_1 = "wscript.exe"
  L4_1 = "cscript.exe"
  L5_1 = "regsvr32.exe"
  L6_1 = "mshta.exe"
  L7_1 = "vbc.exe"
  L8_1 = "msbuild.exe"
  L9_1 = "wmic.exe"
  L10_1 = "cmstp.exe"
  L11_1 = "regasm.exe"
  L12_1 = "installutil.exe"
  L13_1 = "regsvcs.exe"
  L14_1 = "msxsl.exe"
  L15_1 = "xwizard.exe"
  L16_1 = "csc.exe"
  L17_1 = "winword.exe"
  L18_1 = "excel.exe"
  L19_1 = "powerpnt.exe"
  L20_1 = "cmd.exe"
  L21_1 = "powershell.exe"
  L22_1 = "pwsh.exe"
  L23_1 = "forfiles.exe"
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L2_1[3] = L5_1
  L2_1[4] = L6_1
  L2_1[5] = L7_1
  L2_1[6] = L8_1
  L2_1[7] = L9_1
  L2_1[8] = L10_1
  L2_1[9] = L11_1
  L2_1[10] = L12_1
  L2_1[11] = L13_1
  L2_1[12] = L14_1
  L2_1[13] = L15_1
  L2_1[14] = L16_1
  L2_1[15] = L17_1
  L2_1[16] = L18_1
  L2_1[17] = L19_1
  L2_1[18] = L20_1
  L2_1[19] = L21_1
  L2_1[20] = L22_1
  L2_1[21] = L23_1
  L3_1 = MpCommon
  L3_1 = L3_1.GetProcessElevationAndIntegrityLevel
  L4_1 = L0_1.ppid
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L4_1 = next
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = L3_1.IntegrityLevel
      if L4_1 then
        L4_1 = L3_1.IntegrityLevel
        L5_1 = MpCommon
        L5_1 = L5_1.SECURITY_MANDATORY_HIGH_RID
        if L4_1 >= L5_1 then
          L4_1 = IsProcNameInParentProcessTree
          L5_1 = "BM"
          L6_1 = L2_1
          L4_1 = L4_1(L5_1, L6_1)
          if L4_1 then
            L4_1 = nil
            L5_1 = this_sigattrlog
            L5_1 = L5_1[6]
            L5_1 = L5_1.matched
            if L5_1 then
              L5_1 = this_sigattrlog
              L5_1 = L5_1[6]
              L4_1 = L5_1.utf8p1
            end
            L5_1 = sysio
            L5_1 = L5_1.GetFileSize
            L6_1 = L4_1
            L5_1 = L5_1(L6_1)
            L6_1 = sysio
            L6_1 = L6_1.GetLastResult
            L6_1 = L6_1()
            L6_1 = L6_1.Success
            if not L6_1 then
              L6_1 = mp
              L6_1 = L6_1.CLEAN
              return L6_1
            end
            if 65536 < L5_1 then
              L6_1 = 65536
              L5_1 = L6_1 or L5_1
              if not L6_1 then
              end
            end
            L6_1 = sysio
            L6_1 = L6_1.ReadFile
            L7_1 = L4_1
            L8_1 = 0
            L9_1 = L5_1
            L6_1 = L6_1(L7_1, L8_1, L9_1)
            L7_1 = sysio
            L7_1 = L7_1.GetLastResult
            L7_1 = L7_1()
            L7_1 = L7_1.Success
            if not L7_1 then
              L7_1 = mp
              L7_1 = L7_1.CLEAN
              return L7_1
            end
            L7_1 = tostring
            L8_1 = L6_1
            L7_1 = L7_1(L8_1)
            L8_1 = {}
            L9_1 = "I\000n\000j\000e\000c\000t\000D\000l\000l\000"
            L10_1 = "P\000a\000t\000c\000h\000W\0003\0002\000"
            L11_1 = "P\000a\000t\000c\000h\000W\0006\0004\000"
            L12_1 = "I\000g\000n\000o\000r\000e\000L\000o\000a\000d\000L\000i\000b\000r\000a\000r\000y\000"
            L13_1 = "R\000e\000d\000i\000r\000e\000c\000t\000E\000X\000E\000"
            L8_1[1] = L9_1
            L8_1[2] = L10_1
            L8_1[3] = L11_1
            L8_1[4] = L12_1
            L8_1[5] = L13_1
            L9_1 = {}
            L10_1 = "1\192\195"
            L11_1 = "H1\192\195"
            L9_1[1] = L10_1
            L9_1[2] = L11_1
            
            function L10_1(A0_2, A1_2)
              local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
              L2_2 = ipairs
              L3_2 = A1_2
              L2_2, L3_2, L4_2 = L2_2(L3_2)
              for L5_2, L6_2 in L2_2, L3_2, L4_2 do
                L8_2 = A0_2
                L7_2 = A0_2.find
                L9_2 = L6_2
                L10_2 = 1
                L11_2 = true
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
                if L7_2 then
                  L7_2 = true
                  return L7_2
                end
              end
              L2_2 = false
              return L2_2
            end
            
            L11_1 = string
            L11_1 = L11_1.find
            L12_1 = L7_1
            L13_1 = "sdbf"
            L14_1 = 1
            L15_1 = true
            L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
            if L11_1 ~= nil then
              L11_1 = string
              L11_1 = L11_1.find
              L12_1 = L7_1
              L13_1 = "n\000t\000d\000l\000l\000.\000d\000l\000l\000"
              L14_1 = 1
              L15_1 = true
              L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
              if L11_1 ~= nil then
                L11_1 = L10_1
                L12_1 = L7_1
                L13_1 = L8_1
                L11_1 = L11_1(L12_1, L13_1)
                if L11_1 then
                  L11_1 = bm
                  L11_1 = L11_1.add_related_string
                  L12_1 = "[=>] FIX_IDS: "
                  L13_1 = tostring
                  L14_1 = L8_1
                  L13_1 = L13_1(L14_1)
                  L14_1 = bm
                  L14_1 = L14_1.RelatedStringBMReport
                  L11_1(L12_1, L13_1, L14_1)
                  L11_1 = bm
                  L11_1 = L11_1.add_related_string
                  L12_1 = "[->] MEDICATED COMMAND LINE: "
                  L13_1 = L0_1.command_line
                  L14_1 = bm
                  L14_1 = L14_1.RelatedStringBMReport
                  L11_1(L12_1, L13_1, L14_1)
                  L11_1 = mp
                  L11_1 = L11_1.INFECTED
                  return L11_1
                end
                L11_1 = L10_1
                L12_1 = L7_1
                L13_1 = L9_1
                L11_1 = L11_1(L12_1, L13_1)
                if L11_1 then
                  L11_1 = bm
                  L11_1 = L11_1.add_related_string
                  L12_1 = "[=>] FIX_IDS: "
                  L13_1 = tostring
                  L14_1 = L9_1
                  L13_1 = L13_1(L14_1)
                  L14_1 = bm
                  L14_1 = L14_1.RelatedStringBMReport
                  L11_1(L12_1, L13_1, L14_1)
                  L11_1 = bm
                  L11_1 = L11_1.add_related_string
                  L12_1 = "[->] MEDICATED COMMAND LINE: "
                  L13_1 = L0_1.command_line
                  L14_1 = bm
                  L14_1 = L14_1.RelatedStringBMReport
                  L11_1(L12_1, L13_1, L14_1)
                  L11_1 = mp
                  L11_1 = L11_1.INFECTED
                  return L11_1
                end
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
