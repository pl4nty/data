local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "HSTR:Win32/Kernel32_via_PEB"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.executes_from_dynamic_memory
  if L0_1 then
    L0_1 = pehdr
    L0_1 = L0_1.SizeOfImage
    if 196608 <= L0_1 then
      L0_1 = pehdr
      L0_1 = L0_1.SizeOfImage
      if L0_1 <= 5242880 then
        L0_1 = mp
        L0_1 = L0_1.changedetectionname
        L1_1 = 805306470
        L0_1(L1_1)
        L0_1 = mp
        L0_1 = L0_1.INFECTED
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
