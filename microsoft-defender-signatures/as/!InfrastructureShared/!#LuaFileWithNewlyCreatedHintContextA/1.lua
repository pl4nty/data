local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Exception:FileWithNewlyCreatedHintContext"
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 3) then
    goto lbl_28
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_28::
L1_1 = MpCommon
L1_1 = L1_1.AppendPersistContext
L2_1 = L0_1
L3_1 = "MpNewlyCreatedHint_5m"
L4_1 = 300
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "Lua:CloudBlockLevelGT3"
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.AppendPersistContext
  L2_1 = L0_1
  L3_1 = "MpNewlyCreatedHint_30m"
  L4_1 = 1800
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = MpCommon
  L1_1 = L1_1.AppendPersistContext
  L2_1 = L0_1
  L3_1 = "MpNewlyCreatedHint_2h"
  L4_1 = 7200
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "BM_HAS_DIGITALSIGNATURE"
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = MpCommon
  L1_1 = L1_1.AppendPersistContext
  L2_1 = L0_1
  L3_1 = "MpNewlyCreatedHintFileHasDigitalSignature_5m"
  L4_1 = 300
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
