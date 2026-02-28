local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 100000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pe
L1_1 = L1_1.get_versioninfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.FileVersion
  if L2_1 == "2001.12.8530.16385" then
    L2_1 = L1_1.ProductName
    if L2_1 == "Microsoft\194\174 Windows\194\174 Operating System" then
      L2_1 = L1_1.CompanyName
      if L2_1 == "Microsoft Corporation" then
        L2_1 = L1_1.OriginalFilename
        L3_1 = L2_1
        L2_1 = L2_1.find
        L4_1 = ".dll"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if L2_1 then
          L2_1 = L1_1.OriginalFilename
          if L2_1 ~= "msdtcVSp1res.dll" then
            L2_1 = L1_1.OriginalFilename
            if L2_1 ~= "TxfLog.dll" then
              L2_1 = sysio
              L2_1 = L2_1.RegOpenKey
              L3_1 = "HKLM\\SOFTWARE\\Microsoft\\Cryptography"
              L2_1 = L2_1(L3_1)
              if L2_1 ~= nil then
                L3_1 = sysio
                L3_1 = L3_1.GetRegValueAsString
                L4_1 = L2_1
                L5_1 = "MachineGuid"
                L3_1 = L3_1(L4_1, L5_1)
                if L3_1 ~= nil then
                  L4_1 = mp
                  L4_1 = L4_1.set_mpattribute
                  L5_1 = string
                  L5_1 = L5_1.format
                  L6_1 = "MpInternal_researchdata=CryptoMachineGuid=%s"
                  L7_1 = L3_1
                  L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
                  L4_1(L5_1, L6_1, L7_1)
                end
              end
              L3_1 = mp
              L3_1 = L3_1.INFECTED
              return L3_1
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
