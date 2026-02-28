local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 983040 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = " "
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "\t"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "\n"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "\r"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "\"%+\""
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "\"%w-=%w-&\""
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "=\"(AAEAAAD/////AQAAAAAAAAAEAQAAACJT.-)\""
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L3_1 = MpCommon
  L3_1 = L3_1.Base64Decode
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if L3_1 == nil or L3_1 == "" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "MZ\144\000"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L6_1 = L3_1
    L5_1 = L3_1.sub
    L7_1 = L4_1
    L5_1 = L5_1(L6_1, L7_1)
    L6_1 = mp
    L6_1 = L6_1.vfo_add_buffer
    L7_1 = L5_1
    L8_1 = "[SerializedObj]"
    L9_1 = mp
    L9_1 = L9_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L6_1(L7_1, L8_1, L9_1)
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
