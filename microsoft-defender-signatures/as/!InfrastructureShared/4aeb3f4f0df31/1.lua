local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[2]
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L0_1 = L1_1[3]
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L0_1 = L1_1[4]
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[5]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L0_1 = L1_1[5]
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[6]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L0_1 = L1_1[6]
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[7]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L0_1 = L1_1[7]
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[8]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L0_1 = L1_1[8]
            end
          end
        end
      end
    end
  end
end
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.utf8p1
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = isnull
    L2_1 = L0_1.utf8p2
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = isnull
      L2_1 = L0_1.ppid
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = isnull
        L2_1 = L0_1.timestamp
        L1_1 = L1_1(L2_1)
        if not L1_1 then
          goto lbl_84
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_84::
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
    L3_1 = tonumber
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    if not (128 < L3_1) then
      L3_1 = isnull
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        L3_1 = tonumber
        L4_1 = L2_1
        L3_1 = L3_1(L4_1)
        if not (L3_1 < 258) then
          goto lbl_117
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_117::
L3_1 = string
L3_1 = L3_1.match
L4_1 = L0_1.utf8p2
L5_1 = "^([0-9]+);regionsize"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = tonumber
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = bm
L4_1 = L4_1.VirtualQuery
L5_1 = L3_1
L4_1, L5_1 = L4_1(L5_1)
if L4_1 then
  L6_1 = L5_1.state_type
  if L6_1 == 257 then
    goto lbl_152
  end
  L6_1 = L5_1.state_type
  if L6_1 == 513 then
    goto lbl_152
  end
  L6_1 = L5_1.state_type
  if L6_1 == 1025 then
    goto lbl_152
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_152::
L6_1 = string
L6_1 = L6_1.format
L7_1 = "size=%x;cur_protect=%x;alloc_protect=%x;state=%x"
L8_1 = L5_1.size
L9_1 = L5_1.prot
L10_1 = L5_1.alloc_prot
L11_1 = L5_1.state_type
L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1)
L7_1 = find_nearby_protectvmlocal_changes
L8_1 = {}
L9_1 = L0_1.utf8p1
L8_1[1] = L9_1
L9_1 = L0_1.utf8p2
L7_1 = L7_1(L8_1, L9_1)
if L7_1 < 4 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = find_nearby_suspicious_traffic
L9_1 = L0_1.timestamp
L8_1, L9_1 = L8_1(L9_1)
if L8_1 ~= 0 then
  L10_1 = isnull
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  if not L10_1 then
    goto lbl_184
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
do return L10_1 end
::lbl_184::
L10_1 = ""
L11_1 = 10
L12_1 = pairs
L13_1 = L9_1
L12_1, L13_1, L14_1 = L12_1(L13_1)
for L15_1, L16_1 in L12_1, L13_1, L14_1 do
  L17_1 = L16_1.count
  L18_1 = L7_1 - L11_1
  if L17_1 >= L18_1 then
    L17_1 = L16_1.count
    L18_1 = L7_1 + L11_1
    if L17_1 <= L18_1 then
      L17_1 = ""
      L18_1 = pairs
      L19_1 = L16_1.uri
      L18_1, L19_1, L20_1 = L18_1(L19_1)
      for L21_1, L22_1 in L18_1, L19_1, L20_1 do
        L23_1 = string
        L23_1 = L23_1.format
        L24_1 = "%s;%s"
        L25_1 = L17_1
        L26_1 = L22_1
        L23_1 = L23_1(L24_1, L25_1, L26_1)
        L17_1 = L23_1
      end
      L18_1 = string
      L18_1 = L18_1.gsub
      L19_1 = L17_1
      L20_1 = "^,"
      L21_1 = ""
      L18_1 = L18_1(L19_1, L20_1, L21_1)
      L17_1 = L18_1
      L18_1 = string
      L18_1 = L18_1.format
      L19_1 = "%s,{Host=%s;Connections:%d;Uris:%s}"
      L20_1 = L10_1
      L21_1 = L15_1
      L22_1 = L16_1.count
      L23_1 = L17_1
      L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1, L23_1)
      L10_1 = L18_1
    end
  end
end
L12_1 = isnull
L13_1 = L10_1
L12_1 = L12_1(L13_1)
if L12_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L12_1 = string
L12_1 = L12_1.gsub
L13_1 = L10_1
L14_1 = "^,"
L15_1 = ""
L12_1 = L12_1(L13_1, L14_1, L15_1)
L10_1 = L12_1
L12_1 = pcall
L13_1 = bm
L13_1 = L13_1.ReadProcMem
L14_1 = L3_1
L15_1 = 256
L16_1 = L0_1.ppid
L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
if L12_1 then
  L14_1 = isnull
  L15_1 = L13_1
  L14_1 = L14_1(L15_1)
  if not L14_1 then
    L14_1 = bm
    L14_1 = L14_1.add_related_string
    L15_1 = "SuspectedMaskToggling_Buffer"
    L16_1 = string
    L16_1 = L16_1.format
    L17_1 = "Hex=%s"
    L18_1 = tohex
    L19_1 = L13_1
    L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L18_1(L19_1)
    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
    L17_1 = bm
    L17_1 = L17_1.RelatedStringBMReport
    L14_1(L15_1, L16_1, L17_1)
end
else
  L14_1 = bm
  L14_1 = L14_1.add_related_string
  L15_1 = "SuspectedMaskToggling_Buffer"
  L16_1 = "Could not read"
  L17_1 = bm
  L17_1 = L17_1.RelatedStringBMReport
  L14_1(L15_1, L16_1, L17_1)
end
L14_1 = bm
L14_1 = L14_1.add_related_string
L15_1 = "SuspectedMaskToggling"
L16_1 = string
L16_1 = L16_1.format
L17_1 = "ToggleCount=%d;Network={%s};ToggleMasks=%s;ToggleDetails={%s};VirtualQuery={%s}"
L18_1 = L7_1
L19_1 = L10_1
L20_1 = L0_1.utf8p1
L21_1 = L0_1.utf8p2
L22_1 = L6_1
L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1, L21_1, L22_1)
L17_1 = bm
L17_1 = L17_1.RelatedStringBMReport
L14_1(L15_1, L16_1, L17_1)
L14_1 = AddSuspiciousRegion
L15_1 = L3_1
L14_1(L15_1)
L14_1 = TriggerTargetedMemoryScan
L15_1 = L3_1
L16_1 = L0_1.ppid
L14_1(L15_1, L16_1)
L14_1 = bm
L14_1 = L14_1.request_SMS
L15_1 = L0_1.ppid
L16_1 = "H+"
L14_1(L15_1, L16_1)
L14_1 = mp
L14_1 = L14_1.INFECTED
return L14_1
