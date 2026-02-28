local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = peattributes
L0_1 = L0_1.isdll
if L0_1 == true then
  L0_1 = peattributes
  L0_1 = L0_1.hasexports
  if L0_1 == true then
    L0_1 = pehdr
    L0_1 = L0_1.DataDirectory
    L0_1 = L0_1[1]
    L0_1 = L0_1.Size
    if L0_1 ~= 0 then
      L0_1 = mp
      L0_1 = L0_1.getfilesize
      L0_1 = L0_1()
      if L0_1 < 100000 or 500000 < L0_1 then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
      L1_1 = pe
      L1_1 = L1_1.get_versioninfo
      L1_1 = L1_1()
      if L1_1 == nil then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = L1_1.CompanyName
      if L2_1 == "Microsoft Corporation" then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = pehdr
      L2_1 = L2_1.DataDirectory
      L2_1 = L2_1[1]
      L2_1 = L2_1.RVA
      L3_1 = mp
      L3_1 = L3_1.readprotection
      L4_1 = false
      L3_1(L4_1)
      L3_1 = mp
      L3_1 = L3_1.readfile
      L4_1 = pe
      L4_1 = L4_1.foffset_rva
      L5_1 = L2_1
      L4_1 = L4_1(L5_1)
      L5_1 = 36
      L3_1 = L3_1(L4_1, L5_1)
      L4_1 = mp
      L4_1 = L4_1.readu_u32
      L5_1 = L3_1
      L6_1 = 21
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 == 1 then
        L4_1 = mp
        L4_1 = L4_1.readu_u32
        L5_1 = L3_1
        L6_1 = 25
        L4_1 = L4_1(L5_1, L6_1)
        if L4_1 == 1 then
          L4_1 = mp
          L4_1 = L4_1.readu_u32
          L5_1 = L3_1
          L6_1 = 33
          L4_1 = L4_1(L5_1, L6_1)
          L5_1 = pe
          L5_1 = L5_1.mmap_rva
          L6_1 = L4_1
          L7_1 = 4
          L5_1 = L5_1(L6_1, L7_1)
          L3_1 = L5_1
          L5_1 = mp
          L5_1 = L5_1.readu_u32
          L6_1 = L3_1
          L7_1 = 1
          L5_1 = L5_1(L6_1, L7_1)
          L6_1 = pe
          L6_1 = L6_1.mmap_rva
          L7_1 = L5_1
          L8_1 = 18
          L6_1 = L6_1(L7_1, L8_1)
          if L6_1 == "DllRegisterServer\000" or L6_1 == "SetModuleHandle\000" or L6_1 == "StartServer\000" or L6_1 == "StopServer\000" or L6_1 == "MatrixMain\000" then
            L7_1 = mp
            L7_1 = L7_1.INFECTED
            return L7_1
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
