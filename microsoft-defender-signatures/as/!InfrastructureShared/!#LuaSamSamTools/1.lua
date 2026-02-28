local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.getfilename
  L1_1 = mp
  L1_1 = L1_1.bitor
  L2_1 = mp
  L2_1 = L2_1.FILEPATH_QUERY_FNAME
  L3_1 = mp
  L3_1 = L3_1.FILEPATH_QUERY_PATH
  L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1, L3_1)
  L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L0_1
  L5_1 = 1
  L6_1 = 11
  L3_1, L4_1, L5_1, L6_1, L7_1 = L3_1(L4_1, L5_1, L6_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1)
  if L2_1 ~= "\\\\tsclient\\" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:RDPProcExec"
  L3_1(L4_1)
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if L3_1 == "worker.exe" then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "Lua:SamSamWorker"
    L3_1(L4_1)
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L0_1
  L6_1 = 12
  L7_1 = 20
  L4_1, L5_1, L6_1, L7_1 = L4_1(L5_1, L6_1, L7_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  L4_1 = {}
  L4_1.kali = 1
  L4_1.kalilinux = 1
  L4_1.pencha = 1
  L4_1.sila = 1
  L4_1.pendekar = 1
  L4_1.pende5 = 1
  L4_1["b\\sqll"] = 2
  L4_1["b\\sql"] = 2
  L4_1["b\\01"] = 2
  L4_1["b\\1"] = 2
  L5_1 = L4_1[L3_1]
  if L5_1 == 1 then
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Lua:SamSamMachine"
    L5_1(L6_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  else
    L5_1 = L4_1[L3_1]
    if L5_1 == 2 then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "Lua:SamSamPpl"
      L5_1(L6_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
