local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = "AadTenantID"
L1_1 = GetRollingQueueKeys
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = nil
if L1_1 then
  L3_1 = type
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 == "table" then
    L3_1 = L1_1[1]
    if L3_1 then
      L2_1 = L1_1[1]
  end
end
else
  L3_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\CloudDomainJoin\\TenantInfo\\"
  L4_1 = sysio
  L4_1 = L4_1.RegOpenKey
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L5_1 = sysio
    L5_1 = L5_1.RegEnumKeys
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    if L5_1 then
      L6_1 = ipairs
      L7_1 = L5_1
      L6_1, L7_1, L8_1 = L6_1(L7_1)
      for L9_1, L10_1 in L6_1, L7_1, L8_1 do
        if L10_1 then
          L11_1 = type
          L12_1 = L10_1
          L11_1 = L11_1(L12_1)
          if L11_1 == "string" then
            L12_1 = L10_1
            L11_1 = L10_1.match
            L13_1 = "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$"
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 then
              L2_1 = L10_1
              L11_1 = 2592000
              L12_1 = 10
              L13_1 = AppendToRollingQueue
              L14_1 = L0_1
              L15_1 = L2_1
              L16_1 = 1
              L17_1 = L11_1
              L18_1 = L12_1
              L13_1(L14_1, L15_1, L16_1, L17_1, L18_1)
              break
            end
          end
        end
      end
    end
  end
end
if L2_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "aadtenantid"
  L5_1 = L2_1
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
