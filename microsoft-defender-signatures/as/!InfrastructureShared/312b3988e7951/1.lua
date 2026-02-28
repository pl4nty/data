local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "\\Microsoft Office\\root\\Office"
L3_1 = "OneDrive\\OneDrive.exe$"
L4_1 = "\\bin\\PBIDesktop.exe$"
L5_1 = "\\MSS\\IRTKDeploy\\Fennec64.exe$"
L6_1 = "\\program files.-agent.-.exe$"
L7_1 = "\\windows\\system32\\MdmDiagnosticsTool.exe$"
L8_1 = "\\MonAgentCore.exe$"
L9_1 = "\\DNF\\DNF.exe$"
L10_1 = "\\AutomationAnywhere.ManagedDLLWrapper.exe$"
L11_1 = "\\GoogleDriveFS.exe$"
L12_1 = "\\LINE\\bin\\current\\LINE.exe$"
L13_1 = "\\LineCall.exe$"
L14_1 = "\\Telegram Desktop\\Telegram.exe$"
L15_1 = "\\WhatsApp.exe$"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L3_1 = L0_1
L2_1 = L0_1.lower
L2_1 = L2_1(L3_1)
L3_1 = pairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L2_1
  L11_1 = L7_1
  L10_1 = L7_1.lower
  L10_1 = L10_1(L11_1)
  L11_1 = 1
  L12_1 = false
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L3_1 = checkFileLastWriteTime
L4_1 = L0_1
L5_1 = 3600
L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1, L5_1)
if L3_1 == true then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = IsLegacyOrgMachine
L8_1 = L8_1()
if not L8_1 then
  L8_1 = IsTechniqueObservedForPid
  L9_1 = "BM"
  L10_1 = "ttexclusion"
  L8_1 = L8_1(L9_1, L10_1)
  if not L8_1 then
    L8_1 = IsTacticObservedForPid
    L9_1 = "BM"
    L10_1 = "ttexclusion"
    L8_1 = L8_1(L9_1, L10_1)
    if not L8_1 then
      L8_1 = IsTacticObservedForPid
      L9_1 = "BM"
      L10_1 = "ttexclusion_cln"
      L8_1 = L8_1(L9_1, L10_1)
      if not L8_1 then
        goto lbl_80
      end
    end
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
do return L8_1 end
::lbl_80::
L8_1 = nil
L9_1 = this_sigattrlog
L9_1 = L9_1[16]
L9_1 = L9_1.matched
if L9_1 then
  L9_1 = parseNetworkVolumeEvent
  L10_1 = this_sigattrlog
  L10_1 = L10_1[16]
  L9_1 = L9_1(L10_1)
  L8_1 = L9_1
end
L9_1 = isnull
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = isPublicIP
L10_1 = L8_1.DestIp
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = bm
L9_1 = L9_1.GetOverallTrafficVolumes
L9_1 = L9_1()
L10_1 = isnull
L11_1 = L9_1
L10_1 = L10_1(L11_1)
if L10_1 then
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = tonumber
L11_1 = L8_1.Bout
L10_1 = L10_1(L11_1)
if not (L10_1 < 1048576) then
  L10_1 = L9_1.outgoing_req
  if not (L10_1 < 10485760) then
    L10_1 = tonumber
    L11_1 = L8_1.Bin
    L10_1 = L10_1(L11_1)
    L11_1 = tonumber
    L12_1 = L8_1.Bout
    L11_1 = L11_1(L12_1)
    if not (L10_1 > L11_1) then
      L10_1 = L9_1.incoming_response
      L11_1 = L9_1.outgoing_req
      if not (L10_1 > L11_1) then
        goto lbl_141
      end
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
do return L10_1 end
::lbl_141::
L10_1 = nil
L11_1 = this_sigattrlog
L11_1 = L11_1[18]
L11_1 = L11_1.matched
if L11_1 then
  L11_1 = this_sigattrlog
  L11_1 = L11_1[18]
  L11_1 = L11_1.utf8p1
  if L11_1 ~= nil then
    L11_1 = string
    L11_1 = L11_1.match
    L12_1 = this_sigattrlog
    L12_1 = L12_1[18]
    L12_1 = L12_1.utf8p1
    L13_1 = L12_1
    L12_1 = L12_1.lower
    L12_1 = L12_1(L13_1)
    L13_1 = "\\.+(%..+)$"
    L11_1 = L11_1(L12_1, L13_1)
    L10_1 = L11_1
  end
end
L11_1 = add_parents
L11_1()
L11_1 = reportRelatedBmHits
L11_1()
L11_1 = addOverallNetworkVolume
L11_1()
L11_1 = bm
L11_1 = L11_1.add_related_string
L12_1 = "SuspiciosProcessAge"
L13_1 = L4_1
L14_1 = bm
L14_1 = L14_1.RelatedStringBMReport
L11_1(L12_1, L13_1, L14_1)
L11_1 = bm
L11_1 = L11_1.add_related_string
L12_1 = "SensitiveFileExt"
L13_1 = L10_1
L14_1 = bm
L14_1 = L14_1.RelatedStringBMReport
L11_1(L12_1, L13_1, L14_1)
L11_1 = TrackPidAndTechniqueBM
L12_1 = "BM"
L13_1 = "T1567"
L14_1 = "ExfilOverWeb"
L11_1(L12_1, L13_1, L14_1)
L11_1 = mp
L11_1 = L11_1.INFECTED
return L11_1
