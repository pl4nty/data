local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "SLF:"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattributesubstring
  L1_1 = "!ams"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = "SLF:TTCTX:"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
  L0_1 = mp
  L0_1 = L0_1.get_mpattributesubstring
  L1_1 = ":PS/"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = ":PowerShell/"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      goto lbl_37
    end
  end
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
::lbl_37::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
