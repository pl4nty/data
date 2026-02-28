local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p2
  L4_1 = L4_1(L5_1)
  L0_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = this_sigattrlog
  L5_1 = L5_1[1]
  L5_1 = L5_1.utf8p1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.match
  L5_1 = L2_1
  L6_1 = "\\([^\\]+)$"
  L4_1 = L4_1(L5_1, L6_1)
  L1_1 = L4_1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L3_1 = L4_1.ppid
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.utf8p2
    L4_1 = L4_1(L5_1)
    L0_1 = L4_1
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L5_1 = L5_1.utf8p1
    L4_1 = L4_1(L5_1)
    L2_1 = L4_1
    L4_1 = string
    L4_1 = L4_1.match
    L5_1 = L2_1
    L6_1 = "\\([^\\]+)$"
    L4_1 = L4_1(L5_1, L6_1)
    L1_1 = L4_1
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L3_1 = L4_1.ppid
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = this_sigattrlog
      L5_1 = L5_1[3]
      L5_1 = L5_1.utf8p2
      L4_1 = L4_1(L5_1)
      L0_1 = L4_1
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = this_sigattrlog
      L5_1 = L5_1[3]
      L5_1 = L5_1.utf8p1
      L4_1 = L4_1(L5_1)
      L2_1 = L4_1
      L4_1 = string
      L4_1 = L4_1.match
      L5_1 = L2_1
      L6_1 = "\\([^\\]+)$"
      L4_1 = L4_1(L5_1, L6_1)
      L1_1 = L4_1
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L3_1 = L4_1.ppid
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = string
        L4_1 = L4_1.lower
        L5_1 = this_sigattrlog
        L5_1 = L5_1[4]
        L5_1 = L5_1.utf8p2
        L4_1 = L4_1(L5_1)
        L0_1 = L4_1
        L4_1 = string
        L4_1 = L4_1.lower
        L5_1 = this_sigattrlog
        L5_1 = L5_1[4]
        L5_1 = L5_1.utf8p1
        L4_1 = L4_1(L5_1)
        L2_1 = L4_1
        L4_1 = string
        L4_1 = L4_1.match
        L5_1 = L2_1
        L6_1 = "\\([^\\]+)$"
        L4_1 = L4_1(L5_1, L6_1)
        L1_1 = L4_1
        L4_1 = this_sigattrlog
        L4_1 = L4_1[4]
        L3_1 = L4_1.ppid
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[5]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = string
          L4_1 = L4_1.lower
          L5_1 = this_sigattrlog
          L5_1 = L5_1[5]
          L5_1 = L5_1.utf8p2
          L4_1 = L4_1(L5_1)
          L0_1 = L4_1
          L4_1 = string
          L4_1 = L4_1.lower
          L5_1 = this_sigattrlog
          L5_1 = L5_1[5]
          L5_1 = L5_1.utf8p1
          L4_1 = L4_1(L5_1)
          L2_1 = L4_1
          L4_1 = string
          L4_1 = L4_1.match
          L5_1 = L2_1
          L6_1 = "\\([^\\]+)$"
          L4_1 = L4_1(L5_1, L6_1)
          L1_1 = L4_1
          L4_1 = this_sigattrlog
          L4_1 = L4_1[5]
          L3_1 = L4_1.ppid
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[6]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = string
            L4_1 = L4_1.lower
            L5_1 = this_sigattrlog
            L5_1 = L5_1[6]
            L5_1 = L5_1.utf8p2
            L4_1 = L4_1(L5_1)
            L0_1 = L4_1
            L4_1 = string
            L4_1 = L4_1.lower
            L5_1 = this_sigattrlog
            L5_1 = L5_1[6]
            L5_1 = L5_1.utf8p1
            L4_1 = L4_1(L5_1)
            L2_1 = L4_1
            L4_1 = string
            L4_1 = L4_1.match
            L5_1 = L2_1
            L6_1 = "\\([^\\]+)$"
            L4_1 = L4_1(L5_1, L6_1)
            L1_1 = L4_1
            L4_1 = this_sigattrlog
            L4_1 = L4_1[6]
            L3_1 = L4_1.ppid
          else
            L4_1 = mp
            L4_1 = L4_1.CLEAN
            return L4_1
          end
        end
      end
    end
  end
end
if L2_1 == nil or L1_1 == nil or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "T1197"
if L0_1 ~= nil then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L0_1
  L8_1 = ".csv"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L0_1
    L8_1 = ".ora"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      goto lbl_212
    end
  end
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  do return L6_1 end
  ::lbl_212::
  L6_1 = nil
  L7_1 = string
  L7_1 = L7_1.sub
  L8_1 = L0_1
  L9_1 = -1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == "\"" then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = mp
    L8_1 = L8_1.ContextualExpandEnvironmentVariables
    L9_1 = string
    L9_1 = L9_1.match
    L10_1 = L0_1
    L11_1 = " (\"[^\"]+\")[%s]*$"
    L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L9_1(L10_1, L11_1)
    L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
    L6_1 = L7_1
    L7_1 = string
    L7_1 = L7_1.match
    L8_1 = L6_1
    L9_1 = "[^\"].*[^\"]"
    L7_1 = L7_1(L8_1, L9_1)
    L6_1 = L7_1
  else
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = mp
    L8_1 = L8_1.ContextualExpandEnvironmentVariables
    L9_1 = string
    L9_1 = L9_1.match
    L10_1 = L0_1
    L11_1 = " (%S+)[%s]*$"
    L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L9_1(L10_1, L11_1)
    L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L8_1(L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
    L6_1 = L7_1
  end
  if L6_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L6_1
  L9_1 = "\\([^\\]+)$"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 == nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = 600
  L9_1 = MpCommon
  L9_1 = L9_1.QueryPersistContext
  L10_1 = L6_1
  L11_1 = "BitsadminTarget"
  L9_1 = L9_1(L10_1, L11_1)
  if not L9_1 then
    L9_1 = MpCommon
    L9_1 = L9_1.AppendPersistContext
    L10_1 = L6_1
    L11_1 = "BitsadminTarget"
    L12_1 = L8_1
    L9_1(L10_1, L11_1, L12_1)
  end
  L9_1 = "BM_M"
  L10_1 = L5_1
  L9_1 = L9_1 .. L10_1
  L10_1 = table
  L10_1 = L10_1.insert
  L11_1 = L4_1
  L12_1 = L9_1
  L10_1(L11_1, L12_1)
  L10_1 = table
  L10_1 = L10_1.insert
  L11_1 = L4_1
  L12_1 = L9_1
  L13_1 = ":sourcefilename_"
  L14_1 = L1_1
  L12_1 = L12_1 .. L13_1 .. L14_1
  L10_1(L11_1, L12_1)
  L10_1 = table
  L10_1 = L10_1.insert
  L11_1 = L4_1
  L12_1 = L9_1
  L13_1 = ":sourceppid_"
  L14_1 = L3_1
  L12_1 = L12_1 .. L13_1 .. L14_1
  L10_1(L11_1, L12_1)
  L10_1 = table
  L10_1 = L10_1.insert
  L11_1 = L4_1
  L12_1 = L9_1
  L13_1 = ":bits_target_"
  L14_1 = L7_1
  L12_1 = L12_1 .. L13_1 .. L14_1
  L10_1(L11_1, L12_1)
  L10_1 = table
  L10_1 = L10_1.insert
  L11_1 = L4_1
  L12_1 = L9_1
  L13_1 = ":BitsTargetFile"
  L12_1 = L12_1 .. L13_1
  L10_1(L11_1, L12_1)
  L10_1 = false
  L11_1 = TrackFileAndTechnique
  L12_1 = L6_1
  L13_1 = L4_1
  L14_1 = 0
  L15_1 = "BitsadminTargetForExec"
  L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
  L10_1 = L11_1
  if L10_1 == false then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
  L11_1 = mp
  L11_1 = L11_1.INFECTED
  return L11_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
