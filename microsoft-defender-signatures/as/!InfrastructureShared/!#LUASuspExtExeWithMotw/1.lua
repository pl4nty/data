local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
L0_1 = L0_1(L1_1)
if L0_1 == true then
  L0_1 = mp
  L0_1 = L0_1.GetMOTWZone
  L0_1 = L0_1()
  if 3 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.getfilesize
    L0_1 = L0_1()
    if L0_1 <= 4194304 then
      L1_1 = mp
      L1_1 = L1_1.getfilename
      L2_1 = mp
      L2_1 = L2_1.bitor
      L3_1 = mp
      L3_1 = L3_1.FILEPATH_QUERY_FNAME
      L4_1 = mp
      L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
      L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
      L3_1 = L1_1
      L2_1 = L1_1.sub
      L4_1 = -4
      L2_1 = L2_1(L3_1, L4_1)
      L4_1 = L1_1
      L3_1 = L1_1.sub
      L5_1 = -11
      L3_1 = L3_1(L4_1, L5_1)
      L4_1 = {}
      L4_1[".exe"] = true
      L4_1[".dll"] = true
      L4_1[".msi"] = true
      L4_1[".sys"] = true
      L4_1[".quarantine"] = true
      L5_1 = L4_1[L2_1]
      if L5_1 ~= true then
        L5_1 = L4_1[L3_1]
        if L5_1 ~= true then
          goto lbl_49
        end
      end
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      do return L5_1 end
      ::lbl_49::
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = "LUA:SuspExtExeWithMotw.A"
      L5_1(L6_1)
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
