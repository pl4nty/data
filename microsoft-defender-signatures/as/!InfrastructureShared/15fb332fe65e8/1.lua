local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L1_1 = L0_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1.utf8p2
  L3_1 = "vavadmmfname:.+"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_16
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_16::
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1.utf8p1
L3_1 = "(%d+):(%d+)"
L1_1, L2_1 = L1_1(L2_1, L3_1)
L3_1 = isnull
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = tonumber
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 16) then
    L3_1 = isnull
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = tonumber
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if not (16 <= L3_1) then
        goto lbl_44
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_44::
L3_1 = string
L3_1 = L3_1.format
L4_1 = "%s:%s"
L5_1 = L2_1
L6_1 = L1_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = string
L4_1 = L4_1.match
L5_1 = L0_1.utf8p2
L6_1 = "^([0-9]+);regionsize"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = tonumber
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L5_1 = bm
L5_1 = L5_1.VirtualQuery
L6_1 = L4_1
L5_1, L6_1 = L5_1(L6_1)
if L5_1 then
  L7_1 = L6_1.prot
  if L7_1 ~= 4 then
    L7_1 = L6_1.prot
    if L7_1 < 16 then
      goto lbl_85
    end
  end
  L7_1 = L6_1.state_type
  if L7_1 == 257 then
    goto lbl_88
  end
  L7_1 = L6_1.state_type
  if L7_1 == 513 then
    goto lbl_88
  end
end
::lbl_85::
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_88::
L7_1 = string
L7_1 = L7_1.format
L8_1 = "size=%x;cur_protect=%x;alloc_protect=%x;state=%x"
L9_1 = L6_1.size
L10_1 = L6_1.prot
L11_1 = L6_1.alloc_prot
L12_1 = L6_1.state_type
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
L8_1 = find_nearby_protectvmlocal_changes
L9_1 = {}
L10_1 = L0_1.utf8p1
L11_1 = L3_1
L9_1[1] = L10_1
L9_1[2] = L11_1
L10_1 = L0_1.utf8p2
L8_1, L9_1 = L8_1(L9_1, L10_1)
if L8_1 ~= 0 then
  L10_1 = isnull
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  if not L10_1 then
    goto lbl_113
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
do return L10_1 end
::lbl_113::
L10_1 = math_min
L11_1 = L0_1.utf8p1
L11_1 = L9_1[L11_1]
L12_1 = L9_1[L3_1]
L10_1 = L10_1(L11_1, L12_1)
L8_1 = L10_1
if L8_1 < 3 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = find_nearby_suspicious_traffic
L11_1 = L0_1.timestamp
L10_1, L11_1 = L10_1(L11_1)
if L10_1 ~= 0 then
  L12_1 = isnull
  L13_1 = L11_1
  L12_1 = L12_1(L13_1)
  if not L12_1 then
    goto lbl_137
  end
end
L12_1 = mp
L12_1 = L12_1.CLEAN
do return L12_1 end
::lbl_137::
L12_1 = ""
L13_1 = 10
L14_1 = pairs
L15_1 = L11_1
L14_1, L15_1, L16_1 = L14_1(L15_1)
for L17_1, L18_1 in L14_1, L15_1, L16_1 do
  L19_1 = L18_1.count
  L20_1 = L8_1 - L13_1
  if L19_1 >= L20_1 then
    L19_1 = L18_1.count
    L20_1 = L8_1 + L13_1
    if L19_1 <= L20_1 then
      L19_1 = ""
      L20_1 = pairs
      L21_1 = L18_1.uri
      L20_1, L21_1, L22_1 = L20_1(L21_1)
      for L23_1, L24_1 in L20_1, L21_1, L22_1 do
        L25_1 = string
        L25_1 = L25_1.format
        L26_1 = "%s;%s"
        L27_1 = L19_1
        L28_1 = L24_1
        L25_1 = L25_1(L26_1, L27_1, L28_1)
        L19_1 = L25_1
      end
      L20_1 = string
      L20_1 = L20_1.gsub
      L21_1 = L19_1
      L22_1 = "^,"
      L23_1 = ""
      L20_1 = L20_1(L21_1, L22_1, L23_1)
      L19_1 = L20_1
      L20_1 = string
      L20_1 = L20_1.format
      L21_1 = "%s,{Host=%s;Connections:%d;Uris:%s}"
      L22_1 = L12_1
      L23_1 = L17_1
      L24_1 = L18_1.count
      L25_1 = L19_1
      L20_1 = L20_1(L21_1, L22_1, L23_1, L24_1, L25_1)
      L12_1 = L20_1
    end
  end
end
L14_1 = isnull
L15_1 = L12_1
L14_1 = L14_1(L15_1)
if L14_1 then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = string
L14_1 = L14_1.gsub
L15_1 = L12_1
L16_1 = "^,"
L17_1 = ""
L14_1 = L14_1(L15_1, L16_1, L17_1)
L12_1 = L14_1
L14_1 = pcall
L15_1 = bm
L15_1 = L15_1.ReadProcMem
L16_1 = L4_1
L17_1 = 256
L18_1 = L0_1.ppid
L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
if L14_1 then
  L16_1 = isnull
  L17_1 = L15_1
  L16_1 = L16_1(L17_1)
  if not L16_1 then
    L16_1 = bm
    L16_1 = L16_1.add_related_string
    L17_1 = "SuspectedMaskToggling_Buffer"
    L18_1 = string
    L18_1 = L18_1.format
    L19_1 = "Hex=%s"
    L20_1 = tohex
    L21_1 = L15_1
    L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1 = L20_1(L21_1)
    L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1)
    L19_1 = bm
    L19_1 = L19_1.RelatedStringBMReport
    L16_1(L17_1, L18_1, L19_1)
end
else
  L16_1 = bm
  L16_1 = L16_1.add_related_string
  L17_1 = "SuspectedMaskToggling_Buffer"
  L18_1 = "Could not read"
  L19_1 = bm
  L19_1 = L19_1.RelatedStringBMReport
  L16_1(L17_1, L18_1, L19_1)
end
L16_1 = bm
L16_1 = L16_1.add_related_string
L17_1 = "SuspectedMaskToggling"
L18_1 = string
L18_1 = L18_1.format
L19_1 = "ToggleCount=%d;Network={%s};ToggleMasks=%s;ToggleDetails={%s};VirtualQuery={%s}"
L20_1 = L8_1
L21_1 = L12_1
L22_1 = L0_1.utf8p1
L23_1 = L0_1.utf8p2
L24_1 = L7_1
L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1, L23_1, L24_1)
L19_1 = bm
L19_1 = L19_1.RelatedStringBMReport
L16_1(L17_1, L18_1, L19_1)
L16_1 = AddSuspiciousRegion
L17_1 = L4_1
L16_1(L17_1)
L16_1 = TriggerTargetedMemoryScan
L17_1 = L4_1
L18_1 = L0_1.ppid
L16_1(L17_1, L18_1)
L16_1 = bm
L16_1 = L16_1.request_SMS
L17_1 = L0_1.ppid
L18_1 = "H+"
L16_1(L17_1, L18_1)
L16_1 = mp
L16_1 = L16_1.INFECTED
return L16_1
