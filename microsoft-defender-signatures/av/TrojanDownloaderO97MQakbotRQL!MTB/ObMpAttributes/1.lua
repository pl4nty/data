local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 126976 or 458752 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = tostring
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 110128
L4_1 = 200
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "regsvr32 %-silent %.%.\\drezd"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
elseif 131072 < L0_1 then
  L2_1 = tostring
  L3_1 = mp
  L3_1 = L3_1.readfile
  L4_1 = 121696
  L5_1 = 200
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  L2_1 = L3_1
  L3_1 = tostring
  L4_1 = mp
  L4_1 = L4_1.readfile
  L5_1 = 127776
  L6_1 = 600
  L4_1, L5_1, L6_1, L7_1, L8_1 = L4_1(L5_1, L6_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "regsvr32 %-silent %.%.\\drezd"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "regsvr32 %-silent %.%.\\celod"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == nil then
      goto lbl_82
    end
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  do return L4_1 end
  goto lbl_132
  ::lbl_82::
  if 407552 < L0_1 then
    L4_1 = tostring
    L5_1 = mp
    L5_1 = L5_1.readfile
    L6_1 = 406992
    L7_1 = 200
    L5_1, L6_1, L7_1, L8_1 = L5_1(L6_1, L7_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
    L5_1 = tostring
    L6_1 = mp
    L6_1 = L6_1.readfile
    L7_1 = 403376
    L8_1 = 200
    L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    L5_1 = L6_1
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L4_1
    L8_1 = "regsvr32 %-silent %.%.\\fiosa"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 == nil then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L4_1
      L8_1 = "regsvr32 %-silent %.%.\\violaf"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 == nil then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L5_1
        L8_1 = "regsvr32 %-silent %.%.\\xertis"
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 == nil then
          goto lbl_132
        end
      end
    end
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
::lbl_132::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
