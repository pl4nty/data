local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.GetHSTRCallerId
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.HSTR_CALLER_SMS
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "Detection:"
L1_1 = L1_1(L2_1)
L2_1 = #L1_1
if L2_1 == 0 or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = {}
L2_1["Trojan:Win32/Zloader.B"] = true
L2_1["Trojan:Win64/Merlin.A!dha"] = true
L2_1["Trojan:Win32/Astaroth.ZZ"] = true
L2_1["Trojan:Win32/ReflectiveLoaderArtifact.A"] = true
L2_1["Trojan:Win64/ReflectiveLoaderArtifact.A"] = true
L2_1["Trojan:Win64/Cipduk.STA"] = true
L2_1["Trojan:Win32/GenMalAI.AI!sms"] = true
L3_1 = {}
L4_1 = ipairs
L5_1 = L1_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L8_1
  L11_1 = "Detection:FriendlyFile"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if not L9_1 then
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L8_1
    L11_1 = "Exploit:"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if not L9_1 then
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L8_1
      L11_1 = "Virus:"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if not L9_1 then
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "Rogue:"
        L12_1 = 1
        L13_1 = true
        L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
        if not L9_1 then
          L9_1 = string
          L9_1 = L9_1.find
          L10_1 = L8_1
          L11_1 = "Dialer:"
          L12_1 = 1
          L13_1 = true
          L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
          if not L9_1 then
            L9_1 = string
            L9_1 = L9_1.find
            L10_1 = L8_1
            L11_1 = "PWS:"
            L12_1 = 1
            L13_1 = true
            L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
            if not L9_1 then
              L9_1 = string
              L9_1 = L9_1.sub
              L10_1 = L8_1
              L11_1 = string
              L11_1 = L11_1.find
              L12_1 = L8_1
              L13_1 = ":"
              L14_1 = 1
              L15_1 = true
              L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
              L11_1 = L11_1 + 1
              L9_1 = L9_1(L10_1, L11_1)
              L10_1 = L2_1[L9_1]
              if not L10_1 then
                L10_1 = table
                L10_1 = L10_1.insert
                L11_1 = L3_1
                L12_1 = L9_1
                L10_1(L11_1, L12_1)
              end
            end
          end
        end
      end
    end
  end
end
L4_1 = #L3_1
if L4_1 ~= 0 then
  L4_1 = #L3_1
  if 10 <= L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = table
  L4_1 = L4_1.concat
  L5_1 = L3_1
  L6_1 = ";"
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
  L4_1 = MpCommon
  L4_1 = L4_1.BmTriggerSig
  L5_1 = L0_1
  L6_1 = "SmsScanDetection"
  L7_1 = L3_1
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
