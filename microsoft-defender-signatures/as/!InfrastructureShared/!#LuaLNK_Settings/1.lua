local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 61 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 21
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= nil and L0_1 ~= 0 then
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 4
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 4 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:LNK_Settings!HasNameComment"
    L1_1(L2_1)
  end
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 8
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 8 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:LNK_Settings!HasRelativePath"
    L1_1(L2_1)
  end
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 16
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 16 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:LNK_Settings!HasWorkingDir"
    L1_1(L2_1)
  end
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 32
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 32 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:LNK_Settings!HasArguments"
    L1_1(L2_1)
  else
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:LNK_Settings!HasNoArguments"
    L1_1(L2_1)
  end
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 64
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 64 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:LNK_Settings!HasIconLocation"
    L1_1(L2_1)
  end
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 128
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 128 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:LNK_Settings!IsUnicode"
    L1_1(L2_1)
  end
  L1_1 = mp
  L1_1 = L1_1.bitand
  L2_1 = L0_1
  L3_1 = 16384
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == 16384 then
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:LNK_Settings!HasExpIcon"
    L1_1(L2_1)
  end
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 61
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil and L1_1 ~= 0 then
  if L1_1 == 1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:LNK_Settings!RunNormal"
    L2_1(L3_1)
  elseif L1_1 == 3 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:LNK_Settings!RunMaximized"
    L2_1(L3_1)
  elseif L1_1 == 7 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:LNK_Settings!RunMinimized"
    L2_1(L3_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
