local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.ismsil
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 13 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "HSTR:TrojanDownloader:MSIL/CoinMiner.H_Lowfi"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
