local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_REMOTE_SESSION_IP
L0_1, L1_1 = L0_1(L1_1, L2_1)
if not (L0_1 and L1_1) or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_ID
L2_1 = L2_1(L3_1)
if not L2_1 or 12 <= L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.bitor
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_FULL
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_LOWERCASE
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
if not L3_1 then
  L3_1 = ""
end
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = ""
end
if L3_1 == "" or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = pcall
L6_1 = mp
L6_1 = L6_1.get_contextdata
L7_1 = mp
L7_1 = L7_1.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME
L5_1, L6_1 = L5_1(L6_1, L7_1)
L7_1 = pcall
L8_1 = mp
L8_1 = L8_1.get_contextdata
L9_1 = mp
L9_1 = L9_1.CONTEXT_DATA_REMOTE_SESSION_USERNAME
L7_1, L8_1 = L7_1(L8_1, L9_1)
if not (L5_1 and L6_1 and L6_1 ~= "" and L7_1 and L8_1) or L8_1 == "" then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.IsTrustedFile
L10_1 = false
L9_1 = L9_1(L10_1)
if L9_1 == true then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = L1_1
L10_1 = "|"
L11_1 = crypto
L11_1 = L11_1.Sha1Buffer
L12_1 = L6_1
L13_1 = 0
L14_1 = #L6_1
L11_1 = L11_1(L12_1, L13_1, L14_1)
L12_1 = "|"
L13_1 = crypto
L13_1 = L13_1.Sha1Buffer
L14_1 = L8_1
L15_1 = 0
L16_1 = #L8_1
L13_1 = L13_1(L14_1, L15_1, L16_1)
L9_1 = L9_1 .. L10_1 .. L11_1 .. L12_1 .. L13_1
L10_1 = MpCommon
L10_1 = L10_1.Base64Encode
L11_1 = L3_1
L10_1 = L10_1(L11_1)
L11_1 = AppendToRollingQueue
L12_1 = "rq_fileremotedrop"
L13_1 = L10_1
L14_1 = L9_1
L15_1 = 1209600
L16_1 = 100
L17_1 = 1
L11_1(L12_1, L13_1, L14_1, L15_1, L16_1, L17_1)
L11_1 = string
L11_1 = L11_1.format
L12_1 = "MpInternal_researchdata=FileRemoteDropContext=%s"
L13_1 = L9_1
L11_1 = L11_1(L12_1, L13_1)
L12_1 = mp
L12_1 = L12_1.set_mpattribute
L13_1 = L11_1
L12_1(L13_1)
L12_1 = mp
L12_1 = L12_1.set_mpattribute
L13_1 = "MpDisableCaching"
L12_1(L13_1)
L12_1 = mp
L12_1 = L12_1.INFECTED
return L12_1
