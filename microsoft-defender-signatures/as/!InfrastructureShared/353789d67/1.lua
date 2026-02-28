local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 4 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.changedetectionname
  L1_1 = 805306394
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = hstrlog
L0_1 = L0_1[14]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.changedetectionname
  L1_1 = 805306403
  L0_1(L1_1)
end
L0_1 = hstrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[7]
  L0_1 = L0_1.matched
  if not L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[9]
    L0_1 = L0_1.matched
    if not L0_1 then
      goto lbl_107
    end
  end
end
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = string
  L0_1 = L0_1.format
  L1_1 = "HSTR:VirTool:Win32/Obfuscator.ZG_%08X_02_0100"
  L2_1 = hstrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.VA
  L2_1 = L2_1 + 6
  L0_1 = L0_1(L1_1, L2_1)
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = L0_1
  L1_1(L2_1)
else
  L0_1 = hstrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = string
    L0_1 = L0_1.format
    L1_1 = "HSTR:VirTool:Win32/Obfuscator.ZG_%08X_02_0200"
    L2_1 = hstrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.VA
    L2_1 = L2_1 + 40
    L0_1 = L0_1(L1_1, L2_1)
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = L0_1
    L1_1(L2_1)
  else
    L0_1 = hstrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.matched
    if L0_1 then
      L0_1 = string
      L0_1 = L0_1.format
      L1_1 = "HSTR:VirTool:Win32/Obfuscator.ZG_%08X_02_0200"
      L2_1 = hstrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.VA
      L2_1 = L2_1 + 35
      L0_1 = L0_1(L1_1, L2_1)
      L1_1 = mp
      L1_1 = L1_1.set_mpattribute
      L2_1 = L0_1
      L1_1(L2_1)
    else
      L0_1 = hstrlog
      L0_1 = L0_1[5]
      L0_1 = L0_1.matched
      if L0_1 then
        L0_1 = string
        L0_1 = L0_1.format
        L1_1 = "HSTR:VirTool:Win32/Obfuscator.ZG_%08X_02_0200"
        L2_1 = hstrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.VA
        L2_1 = L2_1 + 15
        L0_1 = L0_1(L1_1, L2_1)
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = L0_1
        L1_1(L2_1)
      end
    end
  end
end
::lbl_107::
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
