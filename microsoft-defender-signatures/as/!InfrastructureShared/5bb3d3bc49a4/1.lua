local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p2
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p2
  end
end
L2_1 = {}
L2_1[".one"] = true
L3_1 = bm_AddRelatedFileFromCommandLine
L4_1 = L1_1
L5_1 = L2_1
L6_1 = nil
L7_1 = 1
L3_1(L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= nil then
  L3_1 = extractDllForRegproc
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  L4_1 = StringEndsWith
  L5_1 = L3_1
  L6_1 = ".dll"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  if L3_1 then
    L4_1 = checkFileLastWriteTime
    L5_1 = L3_1
    L6_1 = 600
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == false then
      L4_1 = mp
      L4_1 = L4_1.IsKnownFriendlyFile
      L5_1 = L3_1
      L6_1 = true
      L7_1 = false
      L4_1 = L4_1(L5_1, L6_1, L7_1)
      if L4_1 == false then
        L4_1 = bm
        L4_1 = L4_1.add_related_file
        L5_1 = L3_1
        L4_1(L5_1)
        L4_1 = reportTimingData
        L4_1()
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
