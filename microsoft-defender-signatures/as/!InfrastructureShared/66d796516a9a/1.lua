local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = L0_1.image_path
    if L1_1 ~= nil then
      goto lbl_15
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_15::
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L2_1
L5_1 = "'"
L6_1 = "\""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L2_1
L5_1 = "\"\""
L6_1 = "\""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "objectcategory=([^%s)]+)"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == "user" or L3_1 == "person" then
  L4_1 = TrackPidAndTechnique
  L5_1 = L0_1.ppid
  L6_1 = "T1087"
  L7_1 = "user_discovery_adfind"
  L4_1(L5_1, L6_1, L7_1)
end
if L3_1 == "computer" then
  L4_1 = TrackPidAndTechnique
  L5_1 = L0_1.ppid
  L6_1 = "T1018"
  L7_1 = "system_discovery_adfind"
  L4_1(L5_1, L6_1, L7_1)
end
if L3_1 == "group" then
  L4_1 = TrackPidAndTechnique
  L5_1 = L0_1.ppid
  L6_1 = "T1069"
  L7_1 = "permgroup_discovery_adfind"
  L4_1(L5_1, L6_1, L7_1)
end
if L3_1 == "organizationalunit" then
  L4_1 = TrackPidAndTechnique
  L5_1 = L0_1.ppid
  L6_1 = "T1614"
  L7_1 = "orgunit_discovery_adfind"
  L4_1(L5_1, L6_1, L7_1)
end
if L3_1 == "subnet" then
  L4_1 = TrackPidAndTechnique
  L5_1 = L0_1.ppid
  L6_1 = "T1016"
  L7_1 = "netconfig_discovery_adfind"
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
