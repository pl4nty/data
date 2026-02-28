local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L1_1 = false
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L3_1 = StringStartsWith
    L4_1 = L2_1
    L5_1 = "\\device\\harddiskvolumeshadowcopy"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "\\microsoft\\onedrive\\"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 == nil then
        L3_1 = string
        L3_1 = L3_1.find
        L4_1 = L2_1
        L5_1 = "\\microsoft onedrive\\"
        L6_1 = 1
        L7_1 = true
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if L3_1 == nil then
          goto lbl_45
        end
      end
    end
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  ::lbl_45::
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p2
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
    L2_1 = sysio
    L2_1 = L2_1.IsFileExists
    L3_1 = L0_1
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = mp
    L2_1 = L2_1.IsKnownFriendlyFile
    L3_1 = L0_1
    L4_1 = true
    L5_1 = false
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 == true then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = sysio
    L3_1 = L3_1.GetPEVersionInfo
    L4_1 = L0_1
    L3_1 = L3_1(L4_1)
    L4_1 = L3_1 or L4_1
    if L3_1 then
      L4_1 = L3_1.OriginalFilename
    end
    if L3_1 ~= nil and L4_1 ~= nil then
      L5_1 = string
      L5_1 = L5_1.lower
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 == "filesyncclient.dll" then
        goto lbl_95
      end
    end
    L1_1 = true
  end
end
::lbl_95::
if L1_1 == true and L0_1 ~= nil then
  L2_1 = bm
  L2_1 = L2_1.add_related_file
  L3_1 = L0_1
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
