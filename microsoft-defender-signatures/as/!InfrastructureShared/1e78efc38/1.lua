local L0_1, L1_1
L0_1 = pehdr
L0_1 = L0_1.DataDirectory
L1_1 = pe
L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_DEBUG
L0_1 = L0_1[L1_1]
L0_1 = L0_1.Size
if L0_1 ~= 0 then
  L0_1 = pehdr
  L0_1 = L0_1.DataDirectory
  L1_1 = pe
  L1_1 = L1_1.IMAGE_DIRECTORY_ENTRY_DEBUG
  L0_1 = L0_1[L1_1]
  L0_1 = L0_1.Size
  if L0_1 ~= 0 then
    goto lbl_20
  end
end
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_20::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
