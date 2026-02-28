local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
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
L2_1 = L2_1[23]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[23]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[23]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[24]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[24]
    L2_1 = L2_1.utf8p1
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.lower
      L3_1 = this_sigattrlog
      L3_1 = L3_1[24]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      L1_1 = L2_1
    end
  end
end
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 2) then
    goto lbl_65
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_65::
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "/%.[^/]+$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 4) then
    goto lbl_78
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_78::
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L2_1
L5_1 = 3
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L3_1 == "lockfile" or L3_1 == "env" or L3_1 == "git" or L3_1 == "touch" or L3_1 == "emacs" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "/bin/"
L6_1 = "/usr/bin/"
L7_1 = "/sbin/"
L8_1 = "/usr/sbin/"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L5_1 = ipairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = L9_1
  L11_1 = L3_1
  L10_1 = L10_1 .. L11_1
  if L10_1 then
    L11_1 = sysio
    L11_1 = L11_1.IsFileExists
    L12_1 = L10_1
    L11_1 = L11_1(L12_1)
    if L11_1 then
      L11_1 = addRelatedProcess
      L11_1()
      L11_1 = reportRelatedBmHits
      L11_1()
      L11_1 = TrackPidAndTechniqueBM
      L12_1 = "BM"
      L13_1 = "T1036.005"
      L14_1 = "DefenseEvasion_Masquerading_MatchLegitimateNameLocation"
      L11_1(L12_1, L13_1, L14_1)
      L11_1 = L1_1
      L12_1 = "|"
      L13_1 = L10_1
      L11_1 = L11_1 .. L12_1 .. L13_1
      L12_1 = bm
      L12_1 = L12_1.add_related_string
      L13_1 = "file_metadata"
      L14_1 = L11_1
      L15_1 = bm
      L15_1 = L15_1.RelatedStringBMReport
      L12_1(L13_1, L14_1, L15_1)
      L12_1 = mp
      L12_1 = L12_1.INFECTED
      return L12_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
