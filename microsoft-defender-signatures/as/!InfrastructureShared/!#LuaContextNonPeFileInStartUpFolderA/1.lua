local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILENAME
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 4) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = {}
L1_1.js = true
L1_1.jse = true
L1_1.vbs = true
L1_1.vbe = true
L1_1.wsf = true
L1_1.jar = true
L1_1.hta = true
L1_1.lnk = true
L1_1.cmd = true
L1_1.bat = true
L1_1.doc = true
L1_1.docm = true
L1_1.docx = true
L1_1.xls = true
L1_1.xlsx = true
L2_1 = string
L2_1 = L2_1.match
L3_1 = L0_1
L4_1 = "([^\\%.]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 2) then
    L3_1 = L1_1[L2_1]
    if L3_1 == true then
      goto lbl_49
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_49::
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "Lua:Context/NonPeFileInStartUpFolder.A!"
L5_1 = L2_1
L4_1 = L4_1 .. L5_1
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
