local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tostring
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "= ?%(?%(?\"(.-)\".-= ?%(?%(?\"(.-)\""
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
if L6_1 == nil then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = string
L7_1 = L7_1.len
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 < 5000 then
  L4_1 = 1
  while true do
    L7_1 = #L6_1
    if not (L7_1 < 5000) then
      break
    end
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L2_1
    L9_1 = "= ?%(?%(?\"(.-)\""
    L10_1 = L4_1 + 2
    L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1, L10_1)
    L6_1 = L9_1
    L4_1 = L8_1
    L3_1 = L7_1
    if L3_1 == nil then
      break
    end
  end
end
L7_1 = #L6_1
if L7_1 < 5000 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = "PQ==LQ==PQ==LQ==PQ==LQ==PQ==LQ==PQ==LQ==IA==bQ==bw==ZA==aQ==Zg==aQ==ZQ==ZA==IA==Yg==YQ==cw==ZQ==Ng==NA==IA==bQ==YQ==cg==aw==ZQ==cg==IA==PQ==LQ==PQ==LQ==PQ==LQ==PQ==LQ==PQ==LQ=="
L8_1 = mp
L8_1 = L8_1.UfsSetMetadataStringA
L9_1 = "dkey"
L10_1 = L5_1
L8_1(L9_1, L10_1)
L8_1 = mp
L8_1 = L8_1.vfo_add_buffer
L9_1 = L6_1
L10_1 = L7_1
L9_1 = L9_1 .. L10_1
L10_1 = "[JenxcusBase64Marked]"
L11_1 = mp
L11_1 = L11_1.ADD_VFO_TAKE_ACTION_ON_DAD
L8_1(L9_1, L10_1, L11_1)
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
