local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 5) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "Lua:FileSizeLT2000"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "LUA:FileSizeLE1000.A"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_53
  end
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "summary_%d%d%d%d+_%d%d%d%d+.lnk"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "documentsfolder %d%d%d%d+ 12%d%d2022.lnk"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "report%-%d%d%d+_%d%d%d%d+.lnk"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      goto lbl_53
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_53::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
