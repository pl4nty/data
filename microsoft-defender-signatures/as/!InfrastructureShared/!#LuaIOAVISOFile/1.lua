local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = true
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
L2_1 = 201326592
L3_1 = mp
L3_1 = L3_1.get_mpattribute
L4_1 = "RPF:TopLevelFile"
L3_1 = L3_1(L4_1)
if not L3_1 then
  L0_1 = false
  L2_1 = 12582912
end
if L1_1 < 33792 or L1_1 > L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.bitand
L4_1 = L1_1
L5_1 = 2047
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.getfilename
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1()
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L3_1
L6_1 = -4
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= ".iso" then
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L3_1
  L6_1 = -4
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= ".img" then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = 32768
L6_1 = 16
L4_1 = L4_1(L5_1, L6_1)
L6_1 = L4_1
L5_1 = L4_1.find
L7_1 = "\001CD001\001"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 == 1 then
  if L0_1 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:IOAVTopLevelISOFile"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "//Lua:GIOAVTopLevelISOFile"
    L5_1(L6_1)
  else
    L5_1 = mp
    L5_1 = L5_1.get_mpattribute
    L6_1 = "//Lua:GIOAVFirstISOFileInContainer"
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:IOAVFirstISOFileInContainer"
      L5_1(L6_1)
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "//Lua:GIOAVFirstISOFileInContainer"
      L5_1(L6_1)
    end
  end
else
  L6_1 = L4_1
  L5_1 = L4_1.find
  L7_1 = "\000BEA01\001"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 == 1 then
    if L0_1 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:IOAVTopLevelUDFFile"
      L5_1(L6_1)
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "//Lua:GIOAVTopLevelUDFFile"
      L5_1(L6_1)
    else
      L5_1 = mp
      L5_1 = L5_1.get_mpattribute
      L6_1 = "//Lua:GIOAVFirstUDFFileInContainer"
      L5_1 = L5_1(L6_1)
      if not L5_1 then
        L5_1 = mp
        L5_1 = L5_1.set_mpattribute
        L6_1 = "Lua:IOAVFirstUDFFileInContainer"
        L5_1(L6_1)
        L5_1 = mp
        L5_1 = L5_1.set_mpattribute
        L6_1 = "//Lua:GIOAVFirstUDFFileInContainer"
        L5_1(L6_1)
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
