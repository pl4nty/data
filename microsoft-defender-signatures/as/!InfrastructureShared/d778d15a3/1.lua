local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 7 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "pea_ismsil"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "pea_no_security"
    L0_1 = L0_1(L1_1)
    if L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattribute
      L1_1 = "pea_isexe"
      L0_1 = L0_1(L1_1)
      if L0_1 then
        L0_1 = pe
        L0_1 = L0_1.get_versioninfo
        L0_1 = L0_1()
        if L0_1 ~= nil then
          L1_1 = L0_1.ProductName
          if L1_1 ~= nil then
            L1_1 = L0_1.InternalName
            if L1_1 ~= nil then
              L1_1 = L0_1.CompanyName
              if L1_1 ~= nil then
                L1_1 = L0_1.OriginalFilename
                if L1_1 ~= nil then
                  goto lbl_43
                end
              end
            end
          end
        end
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        do return L1_1 end
        ::lbl_43::
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1.InternalName
        L3_1 = "PvLogic"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == nil then
          L1_1 = mp
          L1_1 = L1_1.INFECTED
          return L1_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
