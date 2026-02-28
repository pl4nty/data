local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = {}
L0_1["qualysagent.exe"] = true
L0_1["pulsesecureservice.exe"] = true
L0_1["911 location manager.exe"] = true
L0_1["logmein.exe"] = true
L0_1["fasm.exe"] = true
L0_1["explodeservicehost.exe"] = true
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1.image_path
  L2_1 = L2_1(L3_1)
  if L2_1 ~= nil then
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "([^\\]+)$"
    L3_1 = L3_1(L4_1, L5_1)
    L4_1 = L0_1[L3_1]
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L2_1
      L6_1 = ":\\windows\\assembly\\nativeimages_"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L2_1
        L6_1 = ":\\programdata\\ctes\\components\\"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          goto lbl_46
        end
      end
    end
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    do return L4_1 end
    ::lbl_46::
    L5_1 = L2_1
    L4_1 = L2_1.find
    L6_1 = "\\relauncher\\.+\\studio%.exe$"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L5_1 = L2_1
      L4_1 = L2_1.find
      L6_1 = "\\relauncher\\.+\\launcher%.exe$"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        goto lbl_59
      end
    end
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  ::lbl_59::
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = mp
  L4_1 = L4_1.GetProcessCommandLine
  L5_1 = L1_1.ppid
  L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "splunkuniversalforwarder"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "\\wdsroot\\exapp\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "\\programdata\\servicenow\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L3_1 = L1_1.ppid
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1.image_path
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L5_1 = L3_1
    L4_1 = L3_1.match
    L6_1 = "([^\\]+)$"
    L4_1 = L4_1(L5_1, L6_1)
    L5_1 = L0_1[L4_1]
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L3_1
      L7_1 = ":\\windows\\assembly\\nativeimages_"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L3_1
        L7_1 = ":\\programdata\\ctes\\components\\"
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          goto lbl_135
        end
      end
    end
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
::lbl_135::
L3_1 = TrackPidAndTechnique
L4_1 = "CMDHSTR"
L5_1 = "T1016"
L6_1 = "network_discovery"
L3_1(L4_1, L5_1, L6_1)
L3_1 = IsDetectionThresholdMet
L4_1 = "CMDHSTR"
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
