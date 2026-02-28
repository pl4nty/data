local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "SCRIPT:AMSIBypass.Patch"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattributesubstring
  L1_1 = "SCRIPT:StrConcat!obfus"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.CLEAN
    return L0_1
  end
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 8192 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = tostring
L3_1 = headerpage
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = 0
L3_1 = 0
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L1_1
L6_1 = " "
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L1_1 = L4_1
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L1_1
L6_1 = "`"
L7_1 = ""
L4_1 = L4_1(L5_1, L6_1, L7_1)
L1_1 = L4_1
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L1_1
L6_1 = "%[char%](%d+)"

function L7_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = "'"
  L2_2 = string
  L2_2 = L2_2.char
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = "'"
  L1_2 = L1_2 .. L2_2 .. L3_2
  return L1_2
end

L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
L3_1 = L5_1
L1_1 = L4_1
L2_1 = L2_1 + L3_1
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L1_1
L6_1 = "\"%+\""
L7_1 = ""
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
L3_1 = L5_1
L1_1 = L4_1
L2_1 = L2_1 + L3_1
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L1_1
L6_1 = "'%+'"
L7_1 = ""
L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
L3_1 = L5_1
L1_1 = L4_1
L2_1 = L2_1 + L3_1
L4_1 = string
L4_1 = L4_1.gsub
L5_1 = L1_1
L6_1 = "\"([%l%d]+)\""
L7_1 = "%1"
L4_1 = L4_1(L5_1, L6_1, L7_1)
L1_1 = L4_1
if L2_1 < 2 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.vfo_add_buffer
L5_1 = L1_1
L6_1 = "[StrConcat]"
L7_1 = mp
L7_1 = L7_1.ADD_VFO_TAKE_ACTION_ON_DAD
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
