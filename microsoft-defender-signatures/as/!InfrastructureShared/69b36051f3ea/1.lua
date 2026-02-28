local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L1_1 = L2_1.ppid
  end
end
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L0_1 = L2_1
L2_1 = StringStartsWith
L3_1 = L0_1
L4_1 = "%"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.find
L4_1 = "microsoft\\onedrive\\"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L3_1 = L0_1
  L2_1 = L0_1.find
  L4_1 = "windows\\ccm"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    goto lbl_55
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_55::
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L0_1
L4_1 = "SuspPathsFromSchTask"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L3_1 = bm
  L3_1 = L3_1.get_process_relationships
  L3_1, L4_1 = L3_1()
  if L3_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = ipairs
  L6_1 = L3_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.image_path
    if L10_1 ~= nil then
      L10_1 = "svchost.exe|taskeng.exe|taskhostw.exe"
      L11_1 = string
      L11_1 = L11_1.lower
      L12_1 = string
      L12_1 = L12_1.match
      L13_1 = L9_1.image_path
      L14_1 = "\\([^\\]+)$"
      L12_1, L13_1, L14_1, L15_1 = L12_1(L13_1, L14_1)
      L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
      if L11_1 ~= nil then
        L12_1 = string
        L12_1 = L12_1.find
        L13_1 = L10_1
        L14_1 = L11_1
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 then
          L12_1 = TrackPidAndTechniqueBM
          L13_1 = L1_1
          L14_1 = "T1053.005"
          L15_1 = "schtask_target"
          L12_1(L13_1, L14_1, L15_1)
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
