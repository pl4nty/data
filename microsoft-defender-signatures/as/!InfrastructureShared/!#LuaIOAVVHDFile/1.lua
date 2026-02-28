local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:TopLevelFile"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "BM_VHD_FILE"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "//Lua:GIOAVFirstVHDFileInContainer"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.set_mpattribute
      L1_1 = "Lua:IOAVFirstVHDFileInContainer"
      L0_1(L1_1)
      L0_1 = mp
      L0_1 = L0_1.set_mpattribute
      L1_1 = "//Lua:GIOAVFirstVHDFileInContainer"
      L0_1(L1_1)
    end
  else
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "Lua:VhdxFile"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "//Lua:GIOAVFirstVHDXFileInContainer"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        L0_1 = mp
        L0_1 = L0_1.set_mpattribute
        L1_1 = "Lua:IOAVFirstVHDXFileInContainer"
        L0_1(L1_1)
        L0_1 = mp
        L0_1 = L0_1.set_mpattribute
        L1_1 = "//Lua:GIOAVFirstVHDXFileInContainer"
        L0_1(L1_1)
      end
    end
  end
else
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "BM_VHD_FILE"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "Lua:IOAVTopLevelVHDFile"
    L0_1(L1_1)
    L0_1 = mp
    L0_1 = L0_1.set_mpattribute
    L1_1 = "//Lua:GIOAVTopLevelVHDFile"
    L0_1(L1_1)
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
