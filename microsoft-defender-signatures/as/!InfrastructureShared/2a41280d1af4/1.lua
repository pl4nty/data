local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = nri
L0_1 = L0_1.GetRawRequestBlob
L0_1 = L0_1()
L1_1 = MpCommon
L1_1 = L1_1.BinaryRegExpSearch
L2_1 = "MGLNDD_((?:[0-9]{1,3}\\.){3}[0-9]{1,3})_([0-9]{1,5})"
L3_1 = L0_1
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
if L1_1 and L2_1 and L3_1 then
  L4_1 = {}
  L5_1 = tostring
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L4_1.ip = L5_1
  L5_1 = tostring
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  L4_1.port = L5_1
  L5_1 = nri
  L5_1 = L5_1.AddTelemetry
  L6_1 = 0
  L7_1 = L4_1
  L5_1(L6_1, L7_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
