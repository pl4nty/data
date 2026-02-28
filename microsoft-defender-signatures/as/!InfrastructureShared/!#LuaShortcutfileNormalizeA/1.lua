local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "PACKED_WITH:[CMDEmbedded]"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = tostring
  L1_1 = headerpage
  L0_1 = L0_1(L1_1)
  L1_1 = 10
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "\000\000"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil or L1_1 >= L2_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L0_1
  L3_1 = L0_1.sub
  L5_1 = 0
  L6_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L0_1 = L3_1
  L3_1 = nil
  L4_1 = false
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = "\""
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = 0
    L7_1 = L0_1
    L6_1 = L0_1.gsub
    L8_1 = "\""
    L9_1 = ""
    L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1)
    L5_1 = L7_1
    L3_1 = L6_1
    if L0_1 and L1_1 < L5_1 then
      L4_1 = true
    end
  end
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = "^"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = 0
    L7_1 = L0_1
    L6_1 = L0_1.gsub
    L8_1 = "^"
    L9_1 = ""
    L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1)
    L5_1 = L7_1
    L3_1 = L6_1
    if L0_1 and L1_1 < L5_1 then
      L4_1 = true
    end
  end
  if L4_1 == true and L3_1 ~= nil then
    L5_1 = #L3_1
    if L1_1 < L5_1 then
      L5_1 = mp
      L5_1 = L5_1.vfo_add_buffer
      L6_1 = L3_1
      L7_1 = "[CMDEmbeddedNorm]"
      L8_1 = mp
      L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
      L5_1(L6_1, L7_1, L8_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
