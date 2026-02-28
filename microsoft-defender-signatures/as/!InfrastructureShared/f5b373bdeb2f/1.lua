local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = versioning
L0_1 = L0_1.GetEngineBuild
L0_1 = L0_1()
if L0_1 < 16700 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = false
if L0_1 == "d7c7c745-195f-4223-9c7a-99fb420fd000" or L0_1 == "c34db763-35fc-4c4a-9ca4-697338808f18" then
  L1_1 = true
else
  L2_1 = MpCommon
  L2_1 = L2_1.IsSampled
  L3_1 = 5000
  L4_1 = false
  L5_1 = true
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == true then
    L1_1 = true
  end
end
if L1_1 == false then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.IsHipsRuleEnabled
L3_1 = "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2"
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L2_1 = L4_1.ppid
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L3_1 = L4_1.utf8p2
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L2_1 = L4_1.ppid
    L4_1 = this_sigattrlog
    L4_1 = L4_1[2]
    L3_1 = L4_1.utf8p2
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L2_1 = L4_1.ppid
      L4_1 = this_sigattrlog
      L4_1 = L4_1[3]
      L3_1 = L4_1.utf8p2
    else
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
end
L4_1 = isnull
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = isnull
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_109
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_109::
L4_1 = mp
L4_1 = L4_1.ContextualExpandEnvironmentVariables
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\microsoft\\windows defender advanced threat protection\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\windows\\ccm\\systemtemp\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\windows\\ccm\\signedscripts\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\windows\\ccmcache\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\microsoft intune management extension\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\saw\\system\\sawhealthcheck.ps1"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\windows\\imecache\\healthscripts\\[^\\]+\\detect%.ps1"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L3_1
L6_1 = "\\windows\\temp\\nessus_[^%.]+%.tmp"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = bm
L4_1 = L4_1.get_process_relationships
L5_1 = L2_1
L4_1, L5_1 = L4_1(L5_1)
L6_1 = isnull
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = ipairs
L7_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  L11_1 = isnull
  L12_1 = L10_1.image_path
  L11_1 = L11_1(L12_1)
  if not L11_1 then
    L11_1 = mp
    L11_1 = L11_1.bitand
    L12_1 = L10_1.reason_ex
    L13_1 = 2
    L11_1 = L11_1(L12_1, L13_1)
    if L11_1 == 2 then
      L11_1 = MpCommon
      L11_1 = L11_1.PathToWin32Path
      L12_1 = L10_1.image_path
      L11_1 = L11_1(L12_1)
      L12_1 = isnull
      L13_1 = L11_1
      L12_1 = L12_1(L13_1)
      if not L12_1 then
        L12_1 = string
        L12_1 = L12_1.lower
        L13_1 = L11_1
        L12_1 = L12_1(L13_1)
        L11_1 = L12_1
        L12_1 = string
        L12_1 = L12_1.find
        L13_1 = L11_1
        L14_1 = "\\windows\\system32\\csrss.exe"
        L15_1 = 1
        L16_1 = true
        L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
        if L12_1 ~= nil then
          L12_1 = mp
          L12_1 = L12_1.CLEAN
          return L12_1
        end
        L12_1 = mp
        L12_1 = L12_1.IsPathExcludedForHipsRule
        L13_1 = L11_1
        L14_1 = "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2"
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 then
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
      end
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
