local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = tostring
L2_1 = footerpage
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L1_1 = {}
L2_1 = "(%(\"cmd.exe.+%);)"
L3_1 = "(\"cmd.exe /c .+%);)"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = #L1_1
L3_1 = nil
L4_1 = 1
L5_1 = L2_1
L6_1 = 1
for L7_1 = L4_1, L5_1, L6_1 do
  L8_1 = string
  L8_1 = L8_1.match
  L9_1 = L0_1
  L10_1 = L1_1[L7_1]
  L8_1 = L8_1(L9_1, L10_1)
  L3_1 = L8_1
  if L3_1 then
    L0_1 = L3_1
    break
  end
end
if L3_1 then
  L4_1 = string
  L4_1 = L4_1.gsub
  L5_1 = L0_1
  L6_1 = "%^"
  L7_1 = ""
  L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 and 20 < L5_1 then
    L6_1 = string
    L6_1 = L6_1.gsub
    L7_1 = L4_1
    L8_1 = "[ \n\r\t]"
    L9_1 = ""
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    L4_1 = L6_1
    L6_1 = mp
    L6_1 = L6_1.vfo_add_buffer
    L7_1 = L4_1
    L8_1 = "[CMDEmbedded]"
    L9_1 = mp
    L9_1 = L9_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L6_1(L7_1, L8_1, L9_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
