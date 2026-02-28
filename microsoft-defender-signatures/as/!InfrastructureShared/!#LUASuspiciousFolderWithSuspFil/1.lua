local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_SCANREASON
  L0_1 = L0_1(L1_1)
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONOPEN
  if L0_1 ~= L1_1 then
    goto lbl_136
  end
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.len
L1_1 = L1_1(L2_1)
if L1_1 < 50 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.find
L3_1 = "\\downloads"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 1048576 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.match
L4_1 = "(.+\\)([^\\]+)$"
L2_1, L3_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L2_1
L4_1 = L2_1.len
L4_1 = L4_1(L5_1)
if 40 < L4_1 and L3_1 ~= nil then
  L5_1 = L2_1
  L4_1 = L2_1.find
  L6_1 = "\\users\\[^\\]+\\downloads\\[0-9a-f]+\\"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L5_1 = L2_1
  L4_1 = L2_1.match
  L6_1 = "\\downloads\\[0-9a-f]+\\"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= nil then
    L6_1 = L4_1
    L5_1 = L4_1.len
    L5_1 = L5_1(L6_1)
    if not (L5_1 < 44) then
      goto lbl_89
    end
  end
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  do return L5_1 end
  ::lbl_89::
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = "LUA:SuspFolderInDownloads.A"
  L5_1(L6_1)
  L6_1 = L3_1
  L5_1 = L3_1.sub
  L7_1 = -4
  L5_1 = L5_1(L6_1, L7_1)
  L7_1 = L3_1
  L6_1 = L3_1.sub
  L8_1 = -5
  L6_1 = L6_1(L7_1, L8_1)
  L7_1 = {}
  L7_1[".doc"] = true
  L7_1[".xls"] = true
  L7_1[".rtf"] = true
  L7_1[".docm"] = true
  L7_1[".xlsm"] = true
  L7_1[".ppam"] = true
  L7_1[".pptm"] = true
  L7_1[".ppsm"] = true
  L7_1[".potm"] = true
  L7_1[".docx"] = true
  L7_1[".xlsx"] = true
  L7_1[".jse"] = true
  L7_1[".vbs"] = true
  L7_1[".wsf"] = true
  L7_1[".vbe"] = true
  L7_1[".hta"] = true
  L7_1[".mht"] = true
  L7_1[".lnk"] = true
  L7_1[".bat"] = true
  L7_1[".ps1"] = true
  L7_1[".cmd"] = true
  L7_1[".url"] = true
  L7_1[".exe"] = true
  L7_1[".scr"] = true
  L7_1[".pif"] = true
  L7_1[".dll"] = true
  L8_1 = L7_1[L5_1]
  if L8_1 ~= true then
    L8_1 = L7_1[L6_1]
    if L8_1 ~= true then
      goto lbl_136
    end
  end
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "LUA:SuspFileInSuspFolder.A"
  L8_1(L9_1)
end
::lbl_136::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
