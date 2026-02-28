local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 122880 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = mp
L2_1 = L2_1.HEADERPAGE_SZ
if L0_1 <= L2_1 then
  L2_1 = tostring
  L3_1 = headerpage
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
else
  L2_1 = mp
  L2_1 = L2_1.readprotection
  L3_1 = false
  L2_1(L3_1)
  L2_1 = tostring
  L3_1 = mp
  L3_1 = L3_1.readfile
  L4_1 = 0
  L5_1 = L0_1
  L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  L1_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.match
L3_1 = L1_1
L4_1 = "getencoder%('utf%-8'%)%('([%w%+/]+=-)'%)"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 128) then
    goto lbl_47
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_47::
L3_1 = mp
L3_1 = L3_1.vfo_add_buffer
L4_1 = L2_1
L5_1 = "[PythonBase64]"
L6_1 = mp
L6_1 = L6_1.ADD_VFO_TAKE_ACTION_ON_DAD
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
