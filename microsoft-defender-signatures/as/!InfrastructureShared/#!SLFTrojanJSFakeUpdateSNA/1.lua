local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".js.zip"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = StringEndsWith
  L2_1 = L0_1
  L3_1 = ".js"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.IOAVGetDownloadUrl
L1_1 = L1_1()
if L1_1 == nil or L1_1 == "" then
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
L3_1 = next
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1.host
if L3_1 ~= nil then
  L3_1 = L2_1.host
  if L3_1 ~= "" then
    L3_1 = L2_1.path
    if L3_1 == nil then
      L3_1 = StringStartsWith
      L4_1 = L2_1.host
      L5_1 = "www"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = L2_1.scheme
        if L3_1 == "https" then
          goto lbl_101
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_101::
L3_1 = split
L4_1 = L2_1.host
L5_1 = "."
L3_1 = L3_1(L4_1, L5_1)
L4_1 = #L3_1
if L4_1 == 3 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
