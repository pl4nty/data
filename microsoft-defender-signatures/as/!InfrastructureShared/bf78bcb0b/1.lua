local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SIGATTR:DelphiFile"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isexe
  if L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[1]
    L0_1 = L0_1.matched
    if not L0_1 then
      L0_1 = hstrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.matched
      if not L0_1 then
        L0_1 = hstrlog
        L0_1 = L0_1[3]
        L0_1 = L0_1.matched
        if not L0_1 then
          L0_1 = hstrlog
          L0_1 = L0_1[4]
          L0_1 = L0_1.matched
          if not L0_1 then
            goto lbl_34
          end
        end
      end
    end
    L0_1 = mp
    L0_1 = L0_1.INFECTED
    return L0_1
  end
end
::lbl_34::
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
