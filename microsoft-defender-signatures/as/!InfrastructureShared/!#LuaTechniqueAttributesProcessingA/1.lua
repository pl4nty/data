local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_PATH
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L1_1 = isDefenderPath
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = "BM_MT"
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if L3_1 ~= 0 then
    L3_1 = #L2_1
    if not (100 <= L3_1) then
      L3_1 = type
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if L3_1 == "table" then
        goto lbl_40
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_40::
L3_1 = {}
L4_1 = {}
L5_1 = ipairs
L6_1 = L2_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.match
  L11_1 = L9_1
  L12_1 = "^BM_M(([tT][0-9][0-9][0-9][0-9])[%.]?[0-9]?[0-9]?[0-9]?):?(.*)"
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  if L10_1 ~= nil and L11_1 ~= nil then
    L12_1 = #L10_1
    if 6 < L12_1 then
      L12_1 = table
      L12_1 = L12_1.insert
      L13_1 = L4_1
      L14_1 = L10_1
      L12_1(L13_1, L14_1)
      L12_1 = mp
      L12_1 = L12_1.set_mpattribute
      L13_1 = "BM_M"
      L14_1 = L10_1
      L13_1 = L13_1 .. L14_1
      L12_1(L13_1)
    end
    L12_1 = table
    L12_1 = L12_1.insert
    L13_1 = L3_1
    L14_1 = L11_1
    L12_1(L13_1, L14_1)
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "BM_M"
    L14_1 = L11_1
    L13_1 = L13_1 .. L14_1
    L12_1(L13_1)
  end
end
L5_1 = #L3_1
if L5_1 <= 1 then
  L5_1 = #L4_1
  if L5_1 <= 1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = #L4_1
if 1 < L5_1 then
  L5_1 = table_distinct_values
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 ~= nil then
    L6_1 = #L5_1
    if 2 <= L6_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:SubTechniqueAttributesGTE2"
      L6_1(L7_1)
    end
    L6_1 = #L5_1
    if 3 <= L6_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:SubTechniqueAttributesGTE3"
      L6_1(L7_1)
    end
    L6_1 = #L5_1
    if 4 <= L6_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:SubTechniqueAttributesGTE4"
      L6_1(L7_1)
    end
  end
end
L5_1 = #L3_1
if 1 < L5_1 then
  L5_1 = table_distinct_values
  L6_1 = L3_1
  L5_1 = L5_1(L6_1)
  if L5_1 ~= nil then
    L6_1 = #L5_1
    if 2 <= L6_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:TechniqueAttributesGTE2"
      L6_1(L7_1)
    end
    L6_1 = #L5_1
    if 3 <= L6_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:TechniqueAttributesGTE3"
      L6_1(L7_1)
    end
    L6_1 = #L5_1
    if 4 <= L6_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "Lua:TechniqueAttributesGTE4"
      L6_1(L7_1)
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
