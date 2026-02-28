local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L2_1 = this_sigattrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L2_1 = L2_1.ppid
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L0_1 = L2_1.ppid
    L2_1 = this_sigattrlog
    L2_1 = L2_1[9]
    L1_1 = L2_1.utf8p2
end
else
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "DestIp=([^;]*);"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 30
L4_1 = "Outgoing_SSH_Brute_"
L5_1 = tostring
L6_1 = L0_1
L5_1 = L5_1(L6_1)
L6_1 = "_"
L4_1 = L4_1 .. L5_1 .. L6_1
L5_1 = 0
L6_1 = 10
L7_1 = L4_1
L8_1 = L2_1
L7_1 = L7_1 .. L8_1
L8_1 = MpCommon
L8_1 = L8_1.AtomicCounterValue
L9_1 = L7_1
L8_1 = L8_1(L9_1)
if L8_1 == nil then
  L8_1 = MpCommon
  L8_1 = L8_1.AtomicCounterSet
  L9_1 = L7_1
  L10_1 = 1
  L11_1 = L3_1
  L8_1(L9_1, L10_1, L11_1)
else
  L8_1 = MpCommon
  L8_1 = L8_1.AtomicCounterAdd
  L9_1 = L7_1
  L10_1 = 1
  L8_1 = L8_1(L9_1, L10_1)
  L5_1 = L8_1 + 1
  if L6_1 < L5_1 then
    L8_1 = TrackPidAndTechniqueBM
    L9_1 = L0_1
    L10_1 = "T1110"
    L11_1 = "CredentialAccess"
    L8_1(L9_1, L10_1, L11_1)
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
