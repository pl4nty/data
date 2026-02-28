local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCRIPT:ChrObfus!filter"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilesize
  L0_1 = L0_1()
  if 24576 < L0_1 then
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
  L2_1 = 0
  L3_1 = string
  L3_1 = L3_1.gsub
  L4_1 = L1_1
  L5_1 = "\"&Chr%((%d%d)%)"
  
  function L6_1(A0_2)
    local L1_2, L2_2
    L1_2 = string
    L1_2 = L1_2.char
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  
  L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
  L2_1 = L2_1 + L4_1
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L3_1
  L7_1 = "&Chr%((%d%d)%)"
  
  function L8_1(A0_2)
    local L1_2, L2_2
    L1_2 = string
    L1_2 = L1_2.char
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L6_1
  L3_1 = L5_1
  L2_1 = L2_1 + L4_1
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L3_1
  L7_1 = "Chr%((%d%d)%)"
  
  function L8_1(A0_2)
    local L1_2, L2_2
    L1_2 = string
    L1_2 = L1_2.char
    L2_2 = A0_2
    return L1_2(L2_2)
  end
  
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L6_1
  L3_1 = L5_1
  L2_1 = L2_1 + L4_1
  if 300 < L2_1 then
    L5_1 = string
    L5_1 = L5_1.gsub
    L6_1 = L3_1
    L7_1 = " _\n"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L5_1 = string
    L5_1 = L5_1.gsub
    L6_1 = L3_1
    L7_1 = "([%w%s])\"&\""
    L8_1 = "%1"
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L5_1 = string
    L5_1 = L5_1.gsub
    L6_1 = L3_1
    L7_1 = "&\""
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L5_1 = string
    L5_1 = L5_1.gsub
    L6_1 = L3_1
    L7_1 = "\"&"
    L8_1 = ""
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L3_1 = L5_1
    L5_1 = mp
    L5_1 = L5_1.vfo_add_buffer
    L6_1 = L3_1
    L7_1 = "[deobfus]"
    L8_1 = mp
    L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L5_1(L6_1, L7_1, L8_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
