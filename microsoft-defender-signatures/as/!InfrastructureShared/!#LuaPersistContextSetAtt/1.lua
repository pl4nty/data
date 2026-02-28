local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 <= 4) then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::

function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  if A1_2 == nil or A2_2 == nil then
    L3_2 = false
    return L3_2
  end
  L3_2 = MpCommon
  L3_2 = L3_2.QueryPersistContext
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  if L3_2 then
    L4_2 = mp
    L4_2 = L4_2.set_mpattribute
    L5_2 = A2_2
    L4_2(L5_2)
    L4_2 = true
    return L4_2
  end
  L4_2 = false
  return L4_2
end

checkPersistContextSetAttribute = L1_1
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -4
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == ".dll" then
  L1_1 = checkPersistContextSetAttribute
  L2_1 = L0_1
  L3_1 = "PossibleDllHijackExecFlowRenameA"
  L4_1 = "Lua:PossibleDllHijackExecFlowRenameA"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = checkPersistContextSetAttribute
  L2_1 = L0_1
  L3_1 = "PossibleDllHijackExecFlowRenameB"
  L4_1 = "Lua:PossibleDllHijackExecFlowRenameB"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = checkPersistContextSetAttribute
  L2_1 = L0_1
  L3_1 = "PossibleDllHijackExecFlowAF"
  L4_1 = "Lua:PossibleDllHijackExecFlowAF"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = checkPersistContextSetAttribute
  L2_1 = L0_1
  L3_1 = "PossibleDllHijackExecFlowAU"
  L4_1 = "Lua:PossibleDllHijackExecFlowAU"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = checkPersistContextSetAttribute
  L2_1 = L0_1
  L3_1 = "PossibleDllHijackExecFlowBF"
  L4_1 = "Lua:PossibleDllHijackExecFlowBF"
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = checkPersistContextSetAttribute
  L2_1 = L0_1
  L3_1 = "PossibleDllHijackExecFlowBU"
  L4_1 = "Lua:PossibleDllHijackExecFlowBU"
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
