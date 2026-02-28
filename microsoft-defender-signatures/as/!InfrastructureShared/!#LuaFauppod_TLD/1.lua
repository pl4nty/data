local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = {}
  L1_2[".monster"] = true
  L1_2[".boats"] = true
  L1_2[".yachts"] = true
  L1_2[".christmas"] = true
  L1_2[".lat"] = true
  L1_2[".icu"] = true
  L1_2[".mom"] = true
  L1_2[".beauty"] = true
  L1_2[".pics"] = true
  L1_2[".autos"] = true
  L1_2[".rest"] = true
  L1_2[".motorcycles"] = true
  L1_2[".makeup"] = true
  L1_2[".hair"] = true
  L1_2[".cyou"] = true
  L1_2[".buzz"] = true
  L1_2[".bond"] = true
  L1_2[".homes"] = true
  L1_2[".skin"] = true
  L2_2 = L1_2[A0_2]
  if L2_2 then
    L2_2 = true
    return L2_2
  end
  L2_2 = false
  return L2_2
end

L1_1 = mp
L1_1 = L1_1.IOAVGetDownloadUrl
L1_1 = L1_1()
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == "about:internet" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = StringEndsWith
L3_1 = L1_1
L4_1 = "/"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = StringStartsWith
L3_1 = L1_1
L4_1 = "https"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = ExtractPartsFromUri
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1.host
if L3_1 ~= "" then
  L3_1 = L2_1.host
  if L3_1 ~= nil then
    goto lbl_59
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_59::
L3_1 = split
L4_1 = L2_1.host
L5_1 = "%."
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L4_1 = #L3_1
  if L4_1 == 3 then
    L4_1 = string
    L4_1 = L4_1.len
    L5_1 = L3_1[1]
    L4_1 = L4_1(L5_1)
    if L4_1 == 8 then
      L4_1 = "."
      L5_1 = tostring
      L6_1 = #L3_1
      L6_1 = L3_1[L6_1]
      L5_1 = L5_1(L6_1)
      L4_1 = L4_1 .. L5_1
      if L4_1 then
        L5_1 = L0_1
        L6_1 = L4_1
        L5_1 = L5_1(L6_1)
        if L5_1 then
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = "//Fauppod_TLD"
          L5_1(L6_1)
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
