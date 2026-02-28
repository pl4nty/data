local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p2
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p1
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L2_1 = L4_1.utf8p1
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L0_1 = L4_1.utf8p2
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.utf8p2
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p1
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L3_1 = L4_1.utf8p1
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L1_1 = L4_1.utf8p2
    end
  end
end
L4_1 = isnull
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = isnull
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
if L0_1 ~= L1_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = {}
L6_1 = string
L6_1 = L6_1.gmatch
L7_1 = L1_1
L8_1 = "(%w+):(%w+)"
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L4_1[L9_1] = L10_1
end
L6_1 = scrubData
L7_1 = L4_1.usrname
L6_1 = L6_1(L7_1)
L7_1 = scrubData
L8_1 = L4_1.domain
L7_1 = L7_1(L8_1)
L8_1 = L4_1.remoteip
if L6_1 ~= nil and L7_1 ~= nil and L8_1 ~= nil then
  L9_1 = table
  L9_1 = L9_1.insert
  L10_1 = L5_1
  L11_1 = {}
  L11_1.RemoteClientUser = L6_1
  L11_1.RemoteClientDomain = L7_1
  L11_1.RemoteClientIP = L8_1
  L12_1 = L3_1
  L13_1 = L2_1
  L11_1[1] = L12_1
  L11_1[2] = L13_1
  L9_1(L10_1, L11_1)
  L9_1 = bm
  L9_1 = L9_1.add_related_string
  L10_1 = "RemoteClientData_table"
  L11_1 = safeJsonSerialize
  L12_1 = L5_1
  L11_1 = L11_1(L12_1)
  L12_1 = bm
  L12_1 = L12_1.RelatedStringBMReport
  L9_1(L10_1, L11_1, L12_1)
  L9_1 = mp
  L9_1 = L9_1.INFECTED
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
