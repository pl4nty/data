local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "Exception:FileWithNewlyCreatedHintContext"
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "Exception:CreateProcessContext/MpNewlyCreatedHint"
  L0_1 = L0_1(L1_1)
  if L0_1 ~= true then
    goto lbl_16
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_16::
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 3) then
    goto lbl_34
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_34::
L1_1 = MpCommon
L1_1 = L1_1.GetPersistContextCount
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 <= 0 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = false
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContext
L4_1 = L0_1
L5_1 = "MpNewlyCreatedHint_5m"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:CreateProcessContext/MpNewlyCreatedHint_5m"
  L3_1(L4_1)
  L2_1 = true
end
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContext
L4_1 = L0_1
L5_1 = "MpNewlyCreatedHint_30m"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:CreateProcessContext/MpNewlyCreatedHint_30m"
  L3_1(L4_1)
  L2_1 = true
end
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContext
L4_1 = L0_1
L5_1 = "MpNewlyCreatedHint_2h"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:CreateProcessContext/MpNewlyCreatedHint_2h"
  L3_1(L4_1)
  L2_1 = true
end
if L2_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
