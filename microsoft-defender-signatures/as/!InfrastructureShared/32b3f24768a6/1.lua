local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1

function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = mp
  L3_2 = L3_2.GetParentProcInfo
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if L3_2 == nil then
    return
  end
  A0_2 = L3_2.ppid
  if A0_2 == nil then
    return
  end
  L4_2 = TrackPidAndTechniqueBM
  L5_2 = A0_2
  L6_2 = A1_2
  L7_2 = A2_2
  L4_2(L5_2, L6_2, L7_2)
  return
end

propagateTTParent = L0_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = {}
  L3_2 = {}
  L4_2 = "/bin/python"
  L5_2 = " -u bin/WALinuxAgent"
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = {}
  L5_2 = ""
  L6_2 = "/opt/microsoft/omsagent/bin/omsadmin.sh"
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L3_2 = ipairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  for L6_2, L7_2 in L3_2, L4_2, L5_2 do
    L8_2 = L7_2[1]
    L9_2 = L7_2[2]
    L10_2 = string
    L10_2 = L10_2.find
    L11_2 = A0_2
    L12_2 = L8_2
    L13_2 = 1
    L14_2 = true
    L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
    if L10_2 then
      L10_2 = string
      L10_2 = L10_2.find
      L11_2 = A1_2
      L12_2 = L9_2
      L13_2 = 1
      L14_2 = true
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
      if L10_2 then
        L10_2 = true
        return L10_2
      end
    end
  end
  L3_2 = false
  return L3_2
end

isProcessExcluded = L0_1
L0_1 = nil
L1_1 = nil
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L0_1 = L4_1.utf8p1
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L1_1 = L4_1.utf8p2
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L2_1 = L4_1.ppid
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L3_1 = L4_1.image_path
end
L4_1 = mp
L4_1 = L4_1.GetProcessCommandLine
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not (L0_1 and L1_1 and L2_1 and L3_1) or not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L0_1
L7_1 = "T%d%d%d%d"
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 or L1_1 == "INFECTED" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = isProcessExcluded
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L6_1 = "Execution_SuspiciousProcessLaunch"
L7_1 = "Execution_SuspiciousCommandline"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = ipairs
L7_1 = L5_1
L6_1, L7_1, L8_1 = L6_1(L7_1)
for L9_1, L10_1 in L6_1, L7_1, L8_1 do
  if L1_1 == L10_1 then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
end
L6_1 = IsDetectionThresholdMetLinux
L7_1 = L2_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L7_1 = bm
  L7_1 = L7_1.trigger_sig
  L8_1 = "SuspiciousTTRel"
  L9_1 = "Detected"
  L7_1(L8_1, L9_1)
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = propagateTTParent
L8_1 = L2_1
L9_1 = L0_1
L10_1 = L1_1
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
