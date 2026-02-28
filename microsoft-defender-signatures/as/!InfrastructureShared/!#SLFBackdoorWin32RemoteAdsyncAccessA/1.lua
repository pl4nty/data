local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESS_ID
L0_1 = L0_1(L1_1)
if L0_1 ~= 4 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = IsADConnectRole
L0_1 = L0_1()
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_PATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L3_1 = L0_1
L2_1 = L0_1.find
L4_1 = "\\Data\\ADSync2019"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 and L1_1 == "ADSync.mdf" then
  L2_1 = pcall
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_REMOTE_SESSION_IP
  L2_1, L3_1 = L2_1(L3_1, L4_1)
  if not (L2_1 and L3_1) or L3_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = string
  L5_1 = L5_1.format
  L6_1 = "MpInternal_researchdata=RemoteAdsyncAccess=%s"
  L7_1 = L3_1
  L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
