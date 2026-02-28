local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 65536 < L0_1 then
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
L4_1 = "chr%(&o(%d%d%d)&%)"

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = string
  L1_2 = L1_2.format
  L2_2 = "\"%c\""
  L3_2 = tonumber
  L4_2 = A0_2
  L5_2 = 8
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  return L1_2(L2_2, L3_2, L4_2, L5_2)
end

L2_1, L3_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 and 10 < L3_1 then
  L4_1 = string
  L4_1 = L4_1.gsub
  L5_1 = L2_1
  L6_1 = "chr%(&o(%d%d)&%)"
  
  function L7_1(A0_2)
    local L1_2, L2_2, L3_2, L4_2, L5_2
    L1_2 = string
    L1_2 = L1_2.format
    L2_2 = "\"%c\""
    L3_2 = tonumber
    L4_2 = A0_2
    L5_2 = 8
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    return L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L2_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.gsub
  L5_1 = L2_1
  L6_1 = "\"&\"(.)\""
  L7_1 = "%1"
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L2_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.gsub
  L5_1 = L2_1
  L6_1 = "\"&\""
  L7_1 = ""
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L2_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.gsub
  L5_1 = L2_1
  L6_1 = "&\""
  L7_1 = ""
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  L2_1 = L4_1
  L4_1 = mp
  L4_1 = L4_1.vfo_add_buffer
  L5_1 = L2_1
  L6_1 = "[Obfuscator.AB]"
  L7_1 = mp
  L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L4_1(L5_1, L6_1, L7_1)
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
