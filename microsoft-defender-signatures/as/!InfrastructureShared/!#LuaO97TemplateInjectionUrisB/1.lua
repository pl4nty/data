local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1536000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "_rels/"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = nil
  L3_1 = 0
  L4_1 = ""
  L5_1 = mp
  L5_1 = L5_1.readprotection
  L6_1 = false
  L5_1(L6_1)
  L5_1 = tostring
  L6_1 = mp
  L6_1 = L6_1.readfile
  L7_1 = 0
  L8_1 = L0_1
  L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L6_1(L7_1, L8_1)
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
  L2_1 = L5_1
  L6_1 = L2_1
  L5_1 = L2_1.gmatch
  L7_1 = "<Relationship %/?([%w:]+.-%/?)/>"
  L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
  for L8_1 in L5_1, L6_1, L7_1 do
    L10_1 = L8_1
    L9_1 = L8_1.match
    L11_1 = "Type%S?=%S?\"[%w:/.]+/relationships/([%w/.]+)"
    L9_1 = L9_1(L10_1, L11_1)
    L11_1 = L8_1
    L10_1 = L8_1.match
    L12_1 = "Target%S?=%S?\"(http[^\"]+)"
    L10_1 = L10_1(L11_1, L12_1)
    if L10_1 ~= nil and L9_1 ~= nil then
      L11_1 = string
      L11_1 = L11_1.lower
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      L12_1 = L4_1
      L13_1 = "\n"
      L14_1 = string
      L14_1 = L14_1.lower
      L15_1 = L9_1
      L14_1 = L14_1(L15_1)
      L15_1 = "->"
      L16_1 = L11_1
      L4_1 = L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1
      L3_1 = L3_1 + 1
    end
  end
  if 1 < L3_1 then
    L5_1 = mp
    L5_1 = L5_1.vfo_add_buffer
    L6_1 = L4_1
    L7_1 = "[officedocuri]"
    L8_1 = mp
    L8_1 = L8_1.ADD_VFO_TAKE_ACTION_ON_DAD
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
