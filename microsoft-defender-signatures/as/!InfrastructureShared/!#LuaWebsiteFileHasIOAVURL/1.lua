local L0_1, L1_1, L2_1, L3_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1)
L2_1 = L0_1
L1_1 = L0_1.len
L1_1 = L1_1(L2_1)
if 8 < L1_1 then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -8
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == ".website" then
    L1_1 = mp
    L1_1 = L1_1.get_mpattribute
    L2_1 = "RPF:TopLevelFile"
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.set_mpattribute
      L2_1 = "Lua:WebsiteFileHasIOAVURL"
      L1_1(L2_1)
    else
      L1_1 = mp
      L1_1 = L1_1.set_mpattribute
      L2_1 = "Lua:WebsiteChildFileHasIOAVURL"
      L1_1(L2_1)
    end
end
else
  L2_1 = L0_1
  L1_1 = L0_1.len
  L1_1 = L1_1(L2_1)
  if 10 < L1_1 then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = -10
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == ".appref-ms" then
      L1_1 = mp
      L1_1 = L1_1.get_mpattribute
      L2_1 = "RPF:TopLevelFile"
      L1_1 = L1_1(L2_1)
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "Lua:ApprefFileHasIOAVURL"
        L1_1(L2_1)
      else
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "Lua:ApprefChildFileHasIOAVURL"
        L1_1(L2_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
