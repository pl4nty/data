local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.match
  L3_1 = L1_1
  L4_1 = "\\users\\[^\\]+\\appdata\\local\\temp\\rar$.+"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:CplWinrarExtracted.A"
    L2_1(L3_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\\temp\\7zo"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:Cpl7ZipExtracted.A"
    L2_1(L3_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\\temp\\wz[0-9a-f][0-9a-f][0-9a-f][0-9a-f]$"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "Lua:CplWinZipExtracted.A"
    L2_1(L3_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
  L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
  if L2_1 == "7zg.exe" then
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "\\desktop\\"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 == nil then
      L4_1 = L1_1
      L3_1 = L1_1.find
      L5_1 = "\\downloads\\"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 == nil then
        goto lbl_80
      end
    end
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:Cpl7ZipExtracted.B"
    L3_1(L4_1)
  end
  ::lbl_80::
  if L2_1 == "explorer.exe" then
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = "\\temp\\temp[0-9]_.+%.zip$" ~= nil
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L3_1 = mp
      L3_1 = L3_1.set_mpattribute
      L4_1 = "Lua:CplExplorerZIPExtracted.A"
      L3_1(L4_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
