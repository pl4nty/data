local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 113 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
else
  L0_1 = hstrlog
  L0_1 = L0_1[5]
  L0_1 = L0_1.matched
  if not L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.matched
    if not L0_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[7]
      L0_1 = L0_1.matched
      if not L0_1 then
        L0_1 = hstrlog
        L0_1 = L0_1[8]
        L0_1 = L0_1.matched
        if not L0_1 then
          L0_1 = hstrlog
          L0_1 = L0_1[9]
          L0_1 = L0_1.matched
          if not L0_1 then
            goto lbl_38
          end
        end
      end
    end
  end
  L0_1 = mp
  L0_1 = L0_1.set_mpattribute
  L1_1 = "do_exhaustivehstr_rescan"
  L0_1(L1_1)
end
::lbl_38::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
