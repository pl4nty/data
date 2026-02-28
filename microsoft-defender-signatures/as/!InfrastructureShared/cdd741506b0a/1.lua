local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1

function L0_1(A0_2)
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

L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.GetProcessElevationAndIntegrityLevel
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L3_1 = L2_1.IntegrityLevel
  L4_1 = MpCommon
  L4_1 = L4_1.SECURITY_MANDATORY_SYSTEM_RID
  if L3_1 >= L4_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.GetProcessCommandLine
L5_1 = L1_1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L0_1
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  L5_1 = sysio
  L5_1 = L5_1.IsFileExists
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = checkFileLastWriteTime
    L6_1 = L4_1
    L7_1 = 3600
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = mp
      L5_1 = L5_1.IsKnownFriendlyFile
      L6_1 = L4_1
      L7_1 = true
      L8_1 = false
      L5_1 = L5_1(L6_1, L7_1, L8_1)
      if not L5_1 then
        L5_1 = {}
        L6_1 = "\\users\\public\\.+"
        L7_1 = "\\users\\.+\\appdata\\roaming\\.+"
        L8_1 = "\\users\\.+\\appdata\\local\\temp\\.+"
        L9_1 = "\\users\\.+\\appdata\\local\\temp\\7z.+"
        L10_1 = "\\users\\.+\\appdata\\local\\temp\\rar.+"
        L11_1 = "\\users\\.+\\appdata\\local\\temp\\bnz.+"
        L12_1 = "\\device\\cdrom.+"
        L13_1 = "\\device\\mup\\.+"
        L5_1[1] = L6_1
        L5_1[2] = L7_1
        L5_1[3] = L8_1
        L5_1[4] = L9_1
        L5_1[5] = L10_1
        L5_1[6] = L11_1
        L5_1[7] = L12_1
        L5_1[8] = L13_1
        L6_1 = ipairs
        L7_1 = L5_1
        L6_1, L7_1, L8_1 = L6_1(L7_1)
        for L9_1, L10_1 in L6_1, L7_1, L8_1 do
          L12_1 = L4_1
          L11_1 = L4_1.find
          L13_1 = L10_1
          L11_1 = L11_1(L12_1, L13_1)
          if L11_1 then
            L11_1 = mp
            L11_1 = L11_1.INFECTED
            return L11_1
          end
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
