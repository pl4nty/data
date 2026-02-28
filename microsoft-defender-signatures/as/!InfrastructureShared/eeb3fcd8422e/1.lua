local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.ContextualExpandEnvironmentVariables
  L3_1 = this_sigattrlog
  L3_1 = L3_1[4]
  L3_1 = L3_1.utf8p2
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
  L0_1 = L1_1
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end

function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = {}
  L2_2 = string
  L2_2 = L2_2.gmatch
  L3_2 = A0_2
  L4_2 = "[^%s]+"
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  for L5_2 in L2_2, L3_2, L4_2 do
    L6_2 = table
    L6_2 = L6_2.insert
    L7_2 = L1_2
    L8_2 = L5_2
    L6_2(L7_2, L8_2)
  end
  L2_2 = nil
  L3_2 = 1
  L4_2 = #L1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = L1_2[L6_2]
    if L7_2 == "/tr" then
      L7_2 = L6_2 + 1
      L2_2 = L1_2[L7_2]
      break
    end
  end
  return L2_2
end

L2_1 = L1_1
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = sysio
  L3_1 = L3_1.IsFileExists
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 then
    L3_1 = checkFileLastWriteTime
    L4_1 = L2_1
    L5_1 = 3600
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.IsKnownFriendlyFile
      L4_1 = L2_1
      L5_1 = true
      L6_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if not L3_1 then
        L3_1 = {}
        L4_1 = "\\users\\public\\.+"
        L5_1 = "\\users\\.+\\appdata\\roaming\\.+"
        L6_1 = "\\users\\.+\\appdata\\local\\temp\\.+"
        L7_1 = "\\users\\.+\\appdata\\local\\temp\\7z.+"
        L8_1 = "\\users\\.+\\appdata\\local\\temp\\rar.+"
        L9_1 = "\\users\\.+\\appdata\\local\\temp\\bnz.+"
        L10_1 = "\\device\\cdrom.+"
        L11_1 = "\\device\\mup\\.+"
        L3_1[1] = L4_1
        L3_1[2] = L5_1
        L3_1[3] = L6_1
        L3_1[4] = L7_1
        L3_1[5] = L8_1
        L3_1[6] = L9_1
        L3_1[7] = L10_1
        L3_1[8] = L11_1
        L4_1 = {}
        L5_1 = "wscript.exe"
        L6_1 = "cscript.exe"
        L7_1 = "regsvr32.exe"
        L8_1 = "mshta.exe"
        L9_1 = "vbc.exe"
        L10_1 = "msbuild.exe"
        L11_1 = "wmic.exe"
        L12_1 = "cmstp.exe"
        L13_1 = "regasm.exe"
        L14_1 = "installutil.exe"
        L15_1 = "regsvcs.exe"
        L16_1 = "msxsl.exe"
        L17_1 = "xwizard.exe"
        L18_1 = "csc.exe"
        L19_1 = "winword.exe"
        L20_1 = "excel.exe"
        L21_1 = "powerpnt.exe"
        L4_1[1] = L5_1
        L4_1[2] = L6_1
        L4_1[3] = L7_1
        L4_1[4] = L8_1
        L4_1[5] = L9_1
        L4_1[6] = L10_1
        L4_1[7] = L11_1
        L4_1[8] = L12_1
        L4_1[9] = L13_1
        L4_1[10] = L14_1
        L4_1[11] = L15_1
        L4_1[12] = L16_1
        L4_1[13] = L17_1
        L4_1[14] = L18_1
        L4_1[15] = L19_1
        L4_1[16] = L20_1
        L4_1[17] = L21_1
        L5_1 = ipairs
        L6_1 = L3_1
        L5_1, L6_1, L7_1 = L5_1(L6_1)
        for L8_1, L9_1 in L5_1, L6_1, L7_1 do
          L11_1 = L2_1
          L10_1 = L2_1.find
          L12_1 = L9_1
          L10_1 = L10_1(L11_1, L12_1)
          if L10_1 then
            L10_1 = IsProcNameInParentProcessTree
            L11_1 = "BM"
            L12_1 = L4_1
            L10_1 = L10_1(L11_1, L12_1)
            if L10_1 then
              L10_1 = mp
              L10_1 = L10_1.INFECTED
              return L10_1
            end
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
