local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  if A0_2 ~= nil then
    L1_2 = #A0_2
    if not (L1_2 <= 3) then
      goto lbl_8
    end
  end
  L1_2 = false
  do return L1_2 end
  ::lbl_8::
  L1_2 = MpCommon
  L1_2 = L1_2.GetPersistContextCount
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 == nil or L1_2 <= 0 then
    L2_2 = false
    return L2_2
  end
  L2_2 = MpCommon
  L2_2 = L2_2.QueryPersistContext
  L3_2 = A0_2
  L4_2 = "MpNewlyCreatedHint_2h"
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = sysio
    L2_2 = L2_2.IsFileExists
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = mp
      L2_2 = L2_2.IsKnownFriendlyFile
      L3_2 = A0_2
      L4_2 = true
      L5_2 = false
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      if L2_2 == false then
        L2_2 = bm
        L2_2 = L2_2.add_threat_file
        L3_2 = A0_2
        L2_2(L3_2)
        L2_2 = true
        return L2_2
      end
    end
  end
  L2_2 = false
  return L2_2
end

L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L1_1 = L2_1.utf8p2
else
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= 0 then
    goto lbl_26
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_26::
L2_1 = false
L4_1 = L1_1
L3_1 = L1_1.gmatch
L5_1 = "([^\r\n]*)\n?"
L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
for L6_1 in L3_1, L4_1, L5_1 do
  L7_1 = mp
  L7_1 = L7_1.ContextualExpandEnvironmentVariables
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L6_1 = L7_1
  L7_1 = L0_1
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  if L7_1 == true then
    L2_1 = true
  end
end
if L2_1 == true then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
