local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[7]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[7]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[7]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[8]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[8]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[8]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[9]
      L2_1 = L2_1.utf8p1
      if L2_1 ~= nil then
        L2_1 = string
        L2_1 = L2_1.lower
        L3_1 = this_sigattrlog
        L3_1 = L3_1[9]
        L3_1 = L3_1.utf8p1
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[10]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[10]
        L2_1 = L2_1.utf8p1
        if L2_1 ~= nil then
          L2_1 = string
          L2_1 = L2_1.lower
          L3_1 = this_sigattrlog
          L3_1 = L3_1[10]
          L3_1 = L3_1.utf8p1
          L2_1 = L2_1(L3_1)
          L1_1 = L2_1
        end
      end
    end
  end
end
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "/[^/]+$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "/bin"
L5_1 = "/usr/bin"
L6_1 = "/sbin"
L7_1 = "/usr/sbin"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = L8_1
  L10_1 = L2_1
  L9_1 = L9_1 .. L10_1
  if L9_1 then
    L10_1 = sysio
    L10_1 = L10_1.IsFileExists
    L11_1 = L9_1
    L10_1 = L10_1(L11_1)
    if L10_1 then
      L10_1 = addRelatedProcess
      L10_1()
      L10_1 = reportRelatedBmHits
      L10_1()
      L10_1 = TrackPidAndTechniqueBM
      L11_1 = "BM"
      L12_1 = "T1036.005"
      L13_1 = "DefenseEvasion_Masquerading_MatchLegitimateNameLocation"
      L10_1(L11_1, L12_1, L13_1)
      L10_1 = L1_1
      L11_1 = "|"
      L12_1 = L9_1
      L10_1 = L10_1 .. L11_1 .. L12_1
      L11_1 = bm
      L11_1 = L11_1.add_related_string
      L12_1 = "file_metadata"
      L13_1 = L10_1
      L14_1 = bm
      L14_1 = L14_1.RelatedStringBMReport
      L11_1(L12_1, L13_1, L14_1)
      L11_1 = mp
      L11_1 = L11_1.INFECTED
      return L11_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
