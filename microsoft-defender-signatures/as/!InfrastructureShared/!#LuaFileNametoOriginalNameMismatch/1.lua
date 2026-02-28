local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = string
L0_1 = L0_1.sub
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L2_1 = 0
L3_1 = -5
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 4) then
    goto lbl_24
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_24::
L1_1 = {}
L1_1[".bin"] = true
L1_1[".cpl"] = true
L1_1[".dat"] = true
L1_1[".db"] = true
L3_1 = L0_1
L2_1 = L0_1.sub
L4_1 = -3
L2_1 = L2_1(L3_1, L4_1)
L2_1 = L1_1[L2_1]
if L2_1 ~= true then
  L3_1 = L0_1
  L2_1 = L0_1.sub
  L4_1 = -4
  L2_1 = L2_1(L3_1, L4_1)
  L2_1 = L1_1[L2_1]
  if L2_1 ~= true then
    goto lbl_44
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_44::
L2_1 = pe
L2_1 = L2_1.get_versioninfo
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.OriginalFilename
  if L3_1 ~= nil then
    goto lbl_58
  end
  L3_1 = L2_1.InternalName
  if L3_1 ~= nil then
    goto lbl_58
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_58::
L3_1 = nil
L4_1 = nil
L5_1 = L2_1.OriginalFilename
if L5_1 ~= nil then
  L5_1 = L2_1.OriginalFilename
  L6_1 = L5_1
  L5_1 = L5_1.lower
  L5_1 = L5_1(L6_1)
  L6_1 = L5_1
  L5_1 = L5_1.match
  L7_1 = "(.+)%."
  L5_1 = L5_1(L6_1, L7_1)
  L3_1 = L5_1
end
L5_1 = L2_1.InternalName
if L5_1 ~= nil then
  L5_1 = L2_1.InternalName
  L6_1 = L5_1
  L5_1 = L5_1.lower
  L5_1 = L5_1(L6_1)
  L6_1 = L5_1
  L5_1 = L5_1.match
  L7_1 = "(.+)%."
  L5_1 = L5_1(L6_1, L7_1)
  L4_1 = L5_1
end
if L3_1 == nil or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L0_1
L7_1 = L3_1
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L0_1
  L7_1 = L4_1
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    goto lbl_107
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_107::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
