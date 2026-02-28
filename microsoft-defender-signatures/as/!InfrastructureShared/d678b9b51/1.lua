local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:PWS:Win32/Simda.gen!B"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.executes_from_dynamic_memory
  if L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.suspicious_image_version
    if L0_1 then
      L0_1 = pehdr
      L0_1 = L0_1.SizeOfImage
      if 1048576 <= L0_1 then
        L0_1 = pehdr
        L0_1 = L0_1.SizeOfImage
        if L0_1 <= 5242880 then
          goto lbl_31
        end
      end
    end
  end
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if not (655360 <= L0_1) then
    goto lbl_38
  end
  L0_1 = pehdr
  L0_1 = L0_1.SizeOfImage
  if not (L0_1 <= 851968) then
    goto lbl_38
  end
end
::lbl_31::
L0_1 = mp
L0_1 = L0_1.changedetectionname
L1_1 = 805306411
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_38::
L0_1 = mp
L0_1 = L0_1.SUSPICIOUS
return L0_1
