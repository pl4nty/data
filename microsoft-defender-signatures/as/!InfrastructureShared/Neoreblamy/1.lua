local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L1_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tasks"
  L2_2 = sysio
  L2_2 = L2_2.RegOpenKey
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = false
  if L2_2 then
    L4_2 = sysio
    L4_2 = L4_2.RegEnumKeys
    L5_2 = L2_2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      L5_2 = ipairs
      L6_2 = L4_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2, L9_2 in L5_2, L6_2, L7_2 do
        L10_2 = sysio
        L10_2 = L10_2.RegOpenKey
        L11_2 = L1_2
        L12_2 = "\\"
        L13_2 = L9_2
        L11_2 = L11_2 .. L12_2 .. L13_2
        L10_2 = L10_2(L11_2)
        if L10_2 then
          L11_2 = sysio
          L11_2 = L11_2.GetRegValueAsString
          L12_2 = L10_2
          L13_2 = "Path"
          L11_2 = L11_2(L12_2, L13_2)
          if L11_2 ~= nil then
            L12_2 = sysio
            L12_2 = L12_2.GetRegValueAsBinary
            L13_2 = L10_2
            L14_2 = "Actions"
            L12_2 = L12_2(L13_2, L14_2)
            if L12_2 ~= nil then
              L13_2 = string
              L13_2 = L13_2.lower
              L14_2 = L12_2
              L13_2 = L13_2(L14_2)
              L12_2 = L13_2
              L13_2 = string
              L13_2 = L13_2.gsub
              L14_2 = L12_2
              L15_2 = "%z"
              L16_2 = ""
              L13_2 = L13_2(L14_2, L15_2, L16_2)
              L15_2 = L13_2
              L14_2 = L13_2.find
              L16_2 = "wscript.exe"
              L17_2 = 1
              L18_2 = true
              L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
              if not L14_2 then
                L15_2 = L13_2
                L14_2 = L13_2.find
                L16_2 = "cscript.exe"
                L17_2 = 1
                L18_2 = true
                L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
                if not L14_2 then
                  goto lbl_79
                end
              end
              L15_2 = L13_2
              L14_2 = L13_2.find
              L16_2 = A0_2
              L17_2 = 1
              L18_2 = true
              L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
              if L14_2 then
                L14_2 = Infrastructure_ReportScheduleTaskByTaskId
                L15_2 = L9_2
                L16_2 = 805306757
                L14_2(L15_2, L16_2)
                L3_2 = true
              end
            end
          end
        end
        ::lbl_79::
      end
    end
  end
  return L3_2
end

L1_1 = Remediation
L1_1 = L1_1.Threat
L1_1 = L1_1.Name
if L1_1 == "Behavior:Win32/Neoreblamy.SR" then
  L1_1 = nil
  L2_1 = ipairs
  L3_1 = Remediation
  L3_1 = L3_1.Threat
  L3_1 = L3_1.Resources
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    L7_1 = L6_1.Schema
    if L7_1 ~= "file" then
      L7_1 = L6_1.Schema
      if L7_1 ~= "process" then
        goto lbl_58
      end
    end
    L7_1 = L6_1.Path
    if L7_1 ~= nil then
      L7_1 = L6_1.Path
      if L7_1 ~= "" then
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = L6_1.Path
        L7_1 = L7_1(L8_1)
        L1_1 = L7_1
        L7_1 = #L1_1
        if 4 < L7_1 then
          L7_1 = string
          L7_1 = L7_1.sub
          L8_1 = L1_1
          L9_1 = -4
          L7_1 = L7_1(L8_1, L9_1)
          if L7_1 == ".wsf" then
            L7_1 = string
            L7_1 = L7_1.sub
            L8_1 = L1_1
            L9_1 = 1
            L10_1 = 4
            L7_1 = L7_1(L8_1, L9_1, L10_1)
            if L7_1 == "\\\\?\\" then
              L7_1 = string
              L7_1 = L7_1.sub
              L8_1 = L1_1
              L9_1 = 5
              L7_1 = L7_1(L8_1, L9_1)
              L1_1 = L7_1
            end
            L7_1 = L0_1
            L8_1 = L1_1
            L7_1(L8_1)
          end
        end
      end
    end
    ::lbl_58::
  end
else
  L1_1 = Remediation
  L1_1 = L1_1.Threat
  L1_1 = L1_1.Name
  if L1_1 == "Trojan:Win32/Neoreblamy" then
    L1_1 = MpCommon
    L1_1 = L1_1.GetPersistContextNoPath
    L2_1 = "Trojan:Win32/Neoreblamy"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L2_1 = ipairs
      L3_1 = L1_1
      L2_1, L3_1, L4_1 = L2_1(L3_1)
      for L5_1, L6_1 in L2_1, L3_1, L4_1 do
        L7_1 = L0_1
        L8_1 = L6_1
        L7_1(L8_1)
      end
    end
  end
end
