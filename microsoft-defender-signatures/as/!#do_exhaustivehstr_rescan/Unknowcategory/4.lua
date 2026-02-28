local L0_1, L1_1
L0_1 = peattributes
L0_1 = L0_1.lastscn_executable
if L0_1 then
  L0_1 = peattributes
  L0_1 = L0_1.epoutofimage
  if L0_1 then
    L0_1 = peattributes
    L0_1 = L0_1.no_ep
    if L0_1 then
      L0_1 = peattributes
      L0_1 = L0_1.entrypoint_in_header
      if L0_1 then
        L0_1 = pehdr
        L0_1 = L0_1.AddressOfEntryPoint
        if L0_1 == 0 then
          L0_1 = pehdr
          L0_1 = L0_1.NumberOfSections
          if L0_1 == 9 then
            L0_1 = pesecs
            L1_1 = pehdr
            L1_1 = L1_1.NumberOfSections
            L0_1 = L0_1[L1_1]
            L0_1 = L0_1.Name
            if L0_1 == ".imports" then
              L0_1 = mp
              L0_1 = L0_1.getfilesize
              L0_1 = L0_1()
              if 851968 < L0_1 and L0_1 < 905216 then
                L1_1 = mp
                L1_1 = L1_1.INFECTED
                return L1_1
              end
            end
          end
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
