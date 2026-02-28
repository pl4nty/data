local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = MpDetection
L0_1 = L0_1.GetCurrentThreat
L0_1 = L0_1()
L1_1 = pairs
L2_1 = L0_1.Resources
L1_1, L2_1, L3_1 = L1_1(L2_1)
for L4_1, L5_1 in L1_1, L2_1, L3_1 do
  L6_1 = L5_1.Schema
  if L6_1 == "file" then
    L6_1 = crypto
    L6_1 = L6_1.bitand
    L7_1 = L5_1.Type
    L8_1 = MpCommon
    L8_1 = L8_1.MPRESOURCE_TYPE_CONCRETE
    L6_1 = L6_1(L7_1, L8_1)
    L7_1 = MpCommon
    L7_1 = L7_1.MPRESOURCE_TYPE_CONCRETE
    if L6_1 == L7_1 then
      L6_1 = Infrastructure_DetectionReportFolder
      L7_1 = 805306519
      L8_1 = L5_1.Path
      L9_1 = true
      L6_1(L7_1, L8_1, L9_1)
    end
  end
end
