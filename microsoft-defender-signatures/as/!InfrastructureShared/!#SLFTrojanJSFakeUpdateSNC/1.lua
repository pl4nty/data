local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1

function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = {}
  L1_2[".monster"] = true
  L1_2[".boats"] = true
  L1_2[".yachts"] = true
  L1_2[".christmas"] = true
  L1_2[".lat"] = true
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

isFakeUpdateTLD = L0_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "\\downloads\\"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".xlsx"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".xls"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".xlsm"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".docx"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".pptx"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".pdf"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".exe"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = StringEndsWith
L2_1 = L0_1
L3_1 = ".mp3"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.IOAVGetDownloadUrl
L1_1 = L1_1()
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_HAS_MOTW_ADS
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.GetMOTWZone
    L2_1 = L2_1()
    L3_1 = L2_1 == 3 or L2_1 == 4
    if L3_1 then
      L4_1 = mp
      L4_1 = L4_1.GetMOTWHostUrl
      L4_1 = L4_1()
      L1_1 = L4_1
    end
  end
end
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
          goto lbl_198
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_198::
L3_1 = split
L4_1 = L2_1.host
L5_1 = "%."
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L4_1 = #L3_1
  if L4_1 == 3 then
    L4_1 = #L3_1
    L4_1 = L3_1[L4_1]
    if L4_1 then
      L4_1 = "."
      L5_1 = tostring
      L6_1 = #L3_1
      L6_1 = L3_1[L6_1]
      L5_1 = L5_1(L6_1)
      L4_1 = L4_1 .. L5_1
      L5_1 = isFakeUpdateTLD
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L5_1 = string
        L5_1 = L5_1.len
        L6_1 = L3_1[1]
        L5_1 = L5_1(L6_1)
        if L5_1 == 8 then
          L5_1 = mp
          L5_1 = L5_1.set_mpattribute
          L6_1 = "FakeUpdate_TLD"
          L5_1(L6_1)
      end
      else
        L5_1 = isSuspTLD
        L6_1 = L4_1
        L5_1 = L5_1(L6_1)
        if L5_1 then
          L5_1 = mp
          L5_1 = L5_1.INFECTED
          return L5_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
