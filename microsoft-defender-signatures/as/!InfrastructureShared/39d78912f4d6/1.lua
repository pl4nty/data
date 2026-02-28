local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = {}
  L3_1["dcpatchscan.exe"] = true
  L3_1["dcconfig.exe"] = true
  L3_1["openit_apicontroller.exe"] = true
  L3_1["taniumclient.exe"] = true
  L3_1["dcreplication.exe"] = true
  L3_1["niniteagent.exe"] = true
  L3_1["qqgame.exe"] = true
  L3_1["xeclient.exe"] = true
  L3_1["xeservice.exe"] = true
  L4_1 = L3_1[L2_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "office365_installer"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L5_1 = L2_1
    L4_1 = L2_1.find
    L6_1 = "ninite"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      goto lbl_46
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
::lbl_46::
L1_1 = TrackPidAndTechnique
L2_1 = "CMDHSTR"
L3_1 = "T1560"
L4_1 = "archive_collected_data"
L1_1(L2_1, L3_1, L4_1)
L1_1 = IsDetectionThresholdMet
L2_1 = "CMDHSTR"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.LOWFI
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.LOWFI
return L1_1
