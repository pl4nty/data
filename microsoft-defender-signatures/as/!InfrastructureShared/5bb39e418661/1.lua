local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = ""
L2_1 = ""
L3_1 = ""
L4_1 = {}
L5_1 = 1
L6_1 = L0_1
L7_1 = 1
for L8_1 = L5_1, L6_1, L7_1 do
  L9_1 = sigattr_tail
  L9_1 = L9_1[L8_1]
  L9_1 = L9_1.attribute
  if L9_1 == 16385 then
    L9_1 = sigattr_tail
    L9_1 = L9_1[L8_1]
    L9_1 = L9_1.utf8p2
    if L9_1 ~= 0 then
      L9_1 = sigattr_tail
      L9_1 = L9_1[L8_1]
      L9_1 = L9_1.utf8p2
      if L9_1 ~= "" then
        L9_1 = sigattr_tail
        L9_1 = L9_1[L8_1]
        L9_1 = L9_1.utf8p2
        L10_1 = L9_1
        L9_1 = L9_1.lower
        L9_1 = L9_1(L10_1)
        L10_1 = {}
        L11_1 = string
        L11_1 = L11_1.gmatch
        L12_1 = L9_1
        L13_1 = "(%w+):(%w+)"
        L11_1, L12_1, L13_1 = L11_1(L12_1, L13_1)
        for L14_1, L15_1 in L11_1, L12_1, L13_1 do
          L10_1[L14_1] = L15_1
        end
        L11_1 = scrubData
        L12_1 = L10_1.usrname
        L11_1 = L11_1(L12_1)
        L1_1 = L11_1
        L11_1 = scrubData
        L12_1 = L10_1.domain
        L11_1 = L11_1(L12_1)
        L2_1 = L11_1
        L3_1 = L10_1.remoteip
        if L1_1 ~= nil and L2_1 ~= nil and L3_1 ~= nil then
          L11_1 = table
          L11_1 = L11_1.insert
          L12_1 = L4_1
          L13_1 = {}
          L13_1.RemoteClientUser = L1_1
          L13_1.RemoteClientDomain = L2_1
          L13_1.RemoteClientIP = L3_1
          L11_1(L12_1, L13_1)
        end
      end
    end
  end
end
L5_1 = #L4_1
if 0 < L5_1 then
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "RemoteClientData"
  L7_1 = safeJsonSerialize
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = reportTimingData
  L5_1()
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
