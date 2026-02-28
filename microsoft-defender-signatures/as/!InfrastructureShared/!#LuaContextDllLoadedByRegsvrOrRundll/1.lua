local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 ~= "regsvr32.exe" and L0_1 ~= "rundll32.exe" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_LOWERCASE
L1_1 = L1_1(L2_1)
L2_1 = MpCommon
L2_1 = L2_1.QueryPersistContext
L3_1 = L1_1
L4_1 = "DllLoadedViaLnk"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  if L0_1 == "regsvr32.exe" then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:Context/DllViaLnkRegsvrLoad"
    L2_1(L3_1)
  elseif L0_1 == "rundll32.exe" then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:Context/DllviaLnkRundllLoad"
    L2_1(L3_1)
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
