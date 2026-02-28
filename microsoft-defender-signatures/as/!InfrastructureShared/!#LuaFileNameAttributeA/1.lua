local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (47 < L1_1) then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = " "
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L2_1 = L0_1
  L1_1 = L0_1.gsub
  L3_1 = "%s"
  L4_1 = "/x20"
  L1_1 = L1_1(L2_1, L3_1, L4_1)
  L0_1 = L1_1
  if L0_1 ~= nil then
    L1_1 = #L0_1
    if not (47 < L1_1) then
      goto lbl_41
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_41::
L1_1 = "Lua:FnameAttr!"
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = L1_1
L4_1 = L0_1
L3_1 = L3_1 .. L4_1
L2_1(L3_1)
L2_1 = nil
L3_1 = string
L3_1 = L3_1.sub
L4_1 = L0_1
L5_1 = #L0_1
L5_1 = L5_1 - 3
L6_1 = #L0_1
L6_1 = L6_1 - 3
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 == "." then
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = -3
  L3_1 = L3_1(L4_1, L5_1)
  L2_1 = L3_1
else
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = #L0_1
  L5_1 = L5_1 - 4
  L6_1 = #L0_1
  L6_1 = L6_1 - 4
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == "." then
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L0_1
    L5_1 = -4
    L3_1 = L3_1(L4_1, L5_1)
    L2_1 = L3_1
  else
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L0_1
    L5_1 = #L0_1
    L5_1 = L5_1 - 2
    L6_1 = #L0_1
    L6_1 = L6_1 - 2
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 == "." then
      L3_1 = string
      L3_1 = L3_1.sub
      L4_1 = L0_1
      L5_1 = -2
      L3_1 = L3_1(L4_1, L5_1)
      L2_1 = L3_1
    end
  end
end
if L2_1 ~= nil then
  L3_1 = #L2_1
  if 1 < L3_1 then
    L3_1 = "Lua:FileExtensionAttr!"
    L4_1 = L2_1
    L3_1 = L3_1 .. L4_1
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = L3_1
    L4_1(L5_1)
    L4_1 = string
    L4_1 = L4_1.sub
    L5_1 = L0_1
    L6_1 = 1
    L7_1 = #L0_1
    L8_1 = #L2_1
    L8_1 = L8_1 + 1
    L7_1 = L7_1 - L8_1
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    L5_1 = "Lua:FnameNoExAttr!"
    L6_1 = L4_1
    L5_1 = L5_1 .. L6_1
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = L5_1
    L6_1(L7_1)
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
