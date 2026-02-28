local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 18) then
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
L3_1 = "->"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "/embeddings/oleobject"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = ".bin->(ole stream"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= nil then
    L1_1 = "Lua:Context/OfficeObjectFileAttachment.A!"
end
else
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "->(ole stream "
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = ")->"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L1_1 = "Lua:Context/OfficeObjectFileAttachment.B!"
  end
  else
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L0_1
    L4_1 = "->(rtf0"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if L2_1 ~= nil then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L0_1
      L4_1 = ")->"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if L2_1 ~= nil then
        L1_1 = "Lua:Context/RtfFileAttachment.A!"
    end
    else
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
  end
end
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 5) then
    goto lbl_103
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_103::
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = #L0_1
L4_1 = L4_1 - 3
L5_1 = #L0_1
L5_1 = L5_1 - 3
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == "." then
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = -3
  L2_1 = L2_1(L3_1, L4_1)
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = L1_1
  L5_1 = L2_1
  L4_1 = L4_1 .. L5_1
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
else
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = #L0_1
  L4_1 = L4_1 - 2
  L5_1 = #L0_1
  L5_1 = L5_1 - 2
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 == "." then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L0_1
    L4_1 = -2
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = L1_1
    L5_1 = L2_1
    L4_1 = L4_1 .. L5_1
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
