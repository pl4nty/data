local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_parent_filehandle
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.is_handle_nil
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 5) then
    goto lbl_29
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_29::
L2_1 = "Lua:WindowsCommonFiles.A!"
if L1_1 == "desktop.ini" then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = L2_1
  L5_1 = "desktop_ini"
  L4_1 = L4_1 .. L5_1
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
elseif L1_1 == "thumbs.db" then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = L2_1
  L5_1 = "thumbs_db"
  L4_1 = L4_1 .. L5_1
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
