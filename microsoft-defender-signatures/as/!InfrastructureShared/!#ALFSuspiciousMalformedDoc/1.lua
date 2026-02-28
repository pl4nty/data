local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = ipairs
  L3_2 = A1_2
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  for L5_2, L6_2 in L2_2, L3_2, L4_2 do
    L7_2 = string
    L7_2 = L7_2.find
    L8_2 = A0_2
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

L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 8192 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.getfilename
  L3_1 = mp
  L3_1 = L3_1.bitor
  L4_1 = mp
  L4_1 = L4_1.FILEPATH_QUERY_FULL
  L5_1 = mp
  L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
  L4_1 = L2_1
  L3_1 = L2_1.match
  L5_1 = "\\[^\\]+$"
  L3_1 = L3_1(L4_1, L5_1)
  L2_1 = L3_1
  if L2_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "antiransomelastic"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = {}
  L4_1 = ".zip"
  L5_1 = "wz"
  L6_1 = "pkm"
  L7_1 = "cache"
  L8_1 = "pkgd"
  L9_1 = "sfc"
  L10_1 = "dcp"
  L11_1 = "P00"
  L3_1[1] = L4_1
  L3_1[2] = L5_1
  L3_1[3] = L6_1
  L3_1[4] = L7_1
  L3_1[5] = L8_1
  L3_1[6] = L9_1
  L3_1[7] = L10_1
  L3_1[8] = L11_1
  L4_1 = L0_1
  L5_1 = L2_1
  L6_1 = L3_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == true then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.readheader
  L5_1 = 2
  L6_1 = 2
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == "\003\004" then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.readprotection
  L6_1 = false
  L5_1(L6_1)
  L5_1 = mp
  L5_1 = L5_1.readfile
  L6_1 = L1_1 - 640
  L7_1 = 624
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = mp
  L6_1 = L6_1.readprotection
  L7_1 = true
  L6_1(L7_1)
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = "/styles.xmlPK"
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L5_1
    L8_1 = "/settings.xmlPK"
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L5_1
      L8_1 = "/core.xmlPK"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        goto lbl_110
      end
    end
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
::lbl_110::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
