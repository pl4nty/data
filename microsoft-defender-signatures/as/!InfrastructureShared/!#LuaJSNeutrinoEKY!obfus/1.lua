local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 4096 < L0_1 then
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
L5_1 = "/%*%w-%*/"
L6_1 = ""
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L2_1 + L4_1
L5_1 = string
L5_1 = L5_1.gsub
L6_1 = L3_1
L7_1 = "\\x(%x%x)"

function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = string
  L1_2 = L1_2.format
  L2_2 = "%c"
  L3_2 = tonumber
  L4_2 = A0_2
  L5_2 = 16
  L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
  return L1_2(L2_2, L3_2, L4_2, L5_2)
end

L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
L4_1 = L6_1
L3_1 = L5_1
L2_1 = L2_1 + L4_1
repeat
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L3_1
  L7_1 = "\"([%w-%.%s/]-)\"%+\"([%w-%.%s/]-)\""
  L8_1 = "\"%1%2\""
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L6_1
  L3_1 = L5_1
  L2_1 = L2_1 + L4_1
until L4_1 == 0
repeat
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L3_1
  L7_1 = "(%d+)%+(%d+)"
  
  function L8_1(A0_2, A1_2)
    local L2_2
    L2_2 = A0_2 + A1_2
    return L2_2
  end
  
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L6_1
  L3_1 = L5_1
  L2_1 = L2_1 + L4_1
until L4_1 == 0
repeat
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L3_1
  L7_1 = "(%d%d?)%-(%d%d?)"
  
  function L8_1(A0_2, A1_2)
    local L2_2
    L2_2 = A0_2 - A1_2
    return L2_2
  end
  
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L6_1
  L3_1 = L5_1
  L2_1 = L2_1 + L4_1
until L4_1 == 0
repeat
  L5_1 = string
  L5_1 = L5_1.gsub
  L6_1 = L3_1
  L7_1 = ";(%a)%[\"(%w+)\"%]%("
  L8_1 = ";%1.%2("
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1 = L6_1
  L3_1 = L5_1
  L2_1 = L2_1 + L4_1
until L4_1 == 0
if 3 < L2_1 then
  L5_1 = mp
  L5_1 = L5_1.vfo_add_buffer
  L6_1 = L3_1
  L7_1 = "[NeutrinoEK.Y]"
  L8_1 = mp
  L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L5_1(L6_1, L7_1, L8_1)
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
