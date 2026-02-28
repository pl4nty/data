local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = pe
L0_1 = L0_1.get_versioninfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.FileOriginalName
  if L1_1 == "CONHOST.EXE" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  if L1_1 == "IEXPLORE.EXE" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = mp
  L2_1 = L2_1.getfilesize
  L2_1 = L2_1()
  if 3400000 < L2_1 and L2_1 < 6400000 then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:RcsAgentSize"
    L3_1(L4_1)
  end
  L3_1 = L0_1.CompanyName
  if L3_1 == "Adobe Inc." then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:SuspCompanySignedVmp.Adobe"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  if L3_1 == "Oracle Corporation" then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:SuspCompanySignedVmp.Oracle"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  if L3_1 == "Microsoft Corporation" then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:SuspCompanySignedVmp.MsftCorp"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  if L3_1 == "Zoom Video Communications, Inc." then
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "Lua:SuspCompanySignedVmp.Zoom"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L5_1 = L3_1
  L4_1 = L3_1.find
  L6_1 = "Microsoft"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L5_1 = L3_1
    L4_1 = L3_1.find
    L6_1 = "Operating System"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:SuspCompanySignedVmp.MfstOs"
      L4_1(L5_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
