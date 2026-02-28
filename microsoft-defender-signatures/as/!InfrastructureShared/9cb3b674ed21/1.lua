local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 6000000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = nil
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L1_1 = L2_1.utf8p2
  end
end
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.ContextualExpandEnvironmentVariables
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.IsKnownFriendlyFile
L4_1 = L2_1
L5_1 = true
L6_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 ~= nil and L3_1 ~= false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.QueryPersistContext
L5_1 = L2_1
L6_1 = "NewPECreatedNoCert"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = TrackPidAndTechniqueBM
L6_1 = "BM"
L7_1 = "T1071"
L8_1 = "command_control_a"
L5_1(L6_1, L7_1, L8_1)
L5_1 = {}
L6_1 = string
L6_1 = L6_1.match
L7_1 = L1_1
L8_1 = "SrcIp=(.-)%."
L6_1 = L6_1(L7_1, L8_1)
L5_1.src_ip = L6_1
L6_1 = string
L6_1 = L6_1.match
L7_1 = L1_1
L8_1 = "SrcPort=(.-)%."
L6_1 = L6_1(L7_1, L8_1)
L5_1.src_port = L6_1
L6_1 = string
L6_1 = L6_1.match
L7_1 = L1_1
L8_1 = "DestIp=(.-)%."
L6_1 = L6_1(L7_1, L8_1)
L5_1.dst_ip = L6_1
L6_1 = string
L6_1 = L6_1.match
L7_1 = L1_1
L8_1 = "DestPort=(.-)%."
L6_1 = L6_1(L7_1, L8_1)
L5_1.dst_port = L6_1
L6_1 = L5_1.src_ip
L7_1 = L5_1.dst_ip
if L6_1 == L7_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = next
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = bm
  L6_1 = L6_1.set_detection_string
  L7_1 = safeJsonSerialize
  L8_1 = L5_1
  L7_1, L8_1 = L7_1(L8_1)
  L6_1(L7_1, L8_1)
end
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
