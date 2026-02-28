local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.isvbnative
if not L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.isvbpcode
  if not L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.isexe
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 253 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "HSTR:TrojanSpy:Win32/VBBanker_lowfi"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
