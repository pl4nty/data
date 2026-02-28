local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 ~= "rundll32.exe" and L0_1 ~= "regsvr32.exe " then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILEPATH
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "\\programdata\\(.+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 1) then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      goto lbl_46
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_46::
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1 = L3_1(L4_1)
L4_1 = L3_1
L3_1 = L3_1.lower
L3_1 = L3_1(L4_1)
L5_1 = L2_1
L4_1 = L2_1.lower
L4_1 = L4_1(L5_1)
if L3_1 == L4_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:SuspDllLoad.SA"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
