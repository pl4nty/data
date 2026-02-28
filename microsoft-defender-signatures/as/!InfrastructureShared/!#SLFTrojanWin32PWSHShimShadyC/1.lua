local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_PATH
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1)
L2_1 = isnull
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_29
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_29::
L2_1 = {}
L3_1 = ".sysmain.sdb"
L2_1[1] = L3_1
L3_1 = contains
L4_1 = L0_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = pcall
L4_1 = mp
L4_1 = L4_1.getfilesize
L3_1, L4_1 = L3_1(L4_1)
if L3_1 then
  L5_1 = isnull
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    goto lbl_59
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_59::
if 65536 < L4_1 then
  L5_1 = 65536
  L4_1 = L5_1 or L4_1
  if not L5_1 then
  end
end
L5_1 = mp
L5_1 = L5_1.readfile
L6_1 = 0
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
L6_1 = isnull
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = tostring
L7_1 = L5_1
L6_1 = L6_1(L7_1)
L5_1 = L6_1
L6_1 = mp
L6_1 = L6_1.readprotection
L7_1 = true
L6_1(L7_1)
L6_1 = {}
L7_1 = "I\000n\000j\000e\000c\000t\000D\000l\000l\000"
L8_1 = "P\000a\000t\000c\000h\000W\0003\0002\000"
L9_1 = "P\000a\000t\000c\000h\000W\0006\0004\000"
L10_1 = "I\000g\000n\000o\000r\000e\000L\000o\000a\000d\000L\000i\000b\000r\000a\000r\000y\000"
L11_1 = "R\000e\000d\000i\000r\000e\000c\000t\000E\000X\000E\000"
L6_1[1] = L7_1
L6_1[2] = L8_1
L6_1[3] = L9_1
L6_1[4] = L10_1
L6_1[5] = L11_1
L7_1 = {}
L8_1 = "1\192\195"
L9_1 = "H1\192\195"
L7_1[1] = L8_1
L7_1[2] = L9_1

function L8_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L8_2 = A0_2
    L7_2 = A0_2.find
    L9_2 = L6_2
    L10_2 = 1
    L11_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    if L7_2 then
      L7_2 = true
      return L7_2
    end
  end
  L2_2 = false
  return L2_2
end

L9_1 = string
L9_1 = L9_1.find
L10_1 = L5_1
L11_1 = "sdbf"
L12_1 = 1
L13_1 = true
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if L9_1 ~= nil then
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L5_1
  L11_1 = "p\000w\000s\000h\000.\000e\000x\000e\000"
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 == nil then
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L5_1
    L11_1 = ".\000p\000w\000s\000h\000"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 == nil then
      L9_1 = string
      L9_1 = L9_1.find
      L10_1 = L5_1
      L11_1 = ".\000M\000i\000c\000r\000o\000s\000o\000f\000t\000.\000*\000"
      L12_1 = 1
      L13_1 = true
      L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
      if L9_1 == nil then
        goto lbl_175
      end
    end
  end
  L9_1 = L8_1
  L10_1 = L5_1
  L11_1 = L6_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L9_1 = set_research_data
    L10_1 = "[=>] FIX_IDS"
    L11_1 = tostring
    L12_1 = L6_1
    L11_1 = L11_1(L12_1)
    L12_1 = false
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = mp
    L9_1 = L9_1.INFECTED
    return L9_1
  end
  L9_1 = L8_1
  L10_1 = L5_1
  L11_1 = L7_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 then
    L9_1 = set_research_data
    L10_1 = "[=>] FIX_IDS:"
    L11_1 = tostring
    L12_1 = L7_1
    L11_1 = L11_1(L12_1)
    L12_1 = false
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = set_research_data
    L10_1 = "[=>] FILEPATH:"
    L11_1 = L0_1
    L12_1 = false
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = set_research_data
    L10_1 = "[=>] FILENAME:"
    L11_1 = L1_1
    L12_1 = false
    L9_1(L10_1, L11_1, L12_1)
    L9_1 = mp
    L9_1 = L9_1.INFECTED
    return L9_1
  end
end
::lbl_175::
L9_1 = mp
L9_1 = L9_1.CLEAN
return L9_1
