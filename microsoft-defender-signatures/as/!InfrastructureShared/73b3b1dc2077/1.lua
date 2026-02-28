local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = ""
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L1_1 = L1_1.utf8p1
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.utf8p1
    if L1_1 ~= "" then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L0_1 = L1_1.utf8p1
    end
  end
end
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "/Users/[^/]+/Library/Group Containers/UBF8T346G9.Office/lck[^/]+"
L4_1 = 1
L5_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "%.([^./]+)$"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == "docx" or L1_1 == "doc" or L1_1 == "xlsx" or L1_1 == "xls" or L1_1 == "pptx" or L1_1 == "ppt" or L1_1 == "json" or L1_1 == "driveupload" or L1_1 == "drivedownload" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end

function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = SuspMacPathsToMonitor
  L2_2 = A0_2
  L3_2 = true
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.find
  L3_2 = "^/Users/[^/]+/Desktop/"
  L4_2 = 1
  L5_2 = false
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.find
    L3_2 = "^/Users/[^/]+/Documents/"
    L4_2 = 1
    L5_2 = false
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L2_2 = A0_2
      L1_2 = A0_2.find
      L3_2 = "^/Users/[^/]+/Downloads/"
      L4_2 = 1
      L5_2 = false
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        L2_2 = A0_2
        L1_2 = A0_2.find
        L3_2 = "^/Users/[^/]+/Library/[^/]+$"
        L4_2 = 1
        L5_2 = false
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L2_2 = A0_2
          L1_2 = A0_2.find
          L3_2 = "^/Users/[^/]+/Library/[^/]+/[^/]+$"
          L4_2 = 1
          L5_2 = false
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not L1_2 then
            L2_2 = A0_2
            L1_2 = A0_2.find
            L3_2 = "^/Library/[^/]+$"
            L4_2 = 1
            L5_2 = false
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if not L1_2 then
              L2_2 = A0_2
              L1_2 = A0_2.find
              L3_2 = "^/Library/[^/]+/[^/]+$"
              L4_2 = 1
              L5_2 = false
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if not L1_2 then
                goto lbl_60
              end
            end
          end
        end
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_60::
  L1_2 = false
  return L1_2
end

ExtendedSuspMacPathsToMonitor = L2_1
L2_1 = ExtendedSuspMacPathsToMonitor
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "BM"
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "/chflags"
L7_1 = -8
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.GetParentProcInfo
  L4_1 = L4_1()
  if L4_1 ~= nil then
    L5_1 = L4_1.ppid
    if L5_1 ~= nil then
      L3_1 = L4_1.ppid
    end
  end
end
if L3_1 == "BM" then
  L4_1 = bm
  L4_1 = L4_1.trigger_sig
  L5_1 = "MacChflagsToHidden"
  L6_1 = L0_1
  L4_1(L5_1, L6_1)
else
  L4_1 = bm
  L4_1 = L4_1.trigger_sig
  L5_1 = "MacChflagsToHidden"
  L6_1 = L0_1
  L7_1 = L3_1
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = TrackPidAndTechniqueBM
L5_1 = L3_1
L6_1 = "T1546.001"
L7_1 = "DefenseEvasion_HideArtifacts_Chflags"
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
