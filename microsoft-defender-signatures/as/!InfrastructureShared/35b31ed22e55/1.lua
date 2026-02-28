local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p2
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "^(.-)\\\\(.-)$"
    L1_1, L2_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil or L2_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = GetRegistryValue
    L4_1 = L1_1
    L5_1 = L2_1
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L3_1
      L6_1 = "A\000\000\000\b\000\002\000\000\000\000\000\000\000\000\000"
      L7_1 = 80
      L8_1 = true
      L4_1, L5_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L5_1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L3_1
        L8_1 = "\f\000\002\000\001"
        L9_1 = L5_1
        L10_1 = true
        L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        L5_1 = L7_1
        L4_1 = L6_1
        if not L5_1 then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L3_1
        L8_1 = " \136\0034\167\003"
        L9_1 = L5_1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L3_1
          L8_1 = "\129\019\202\166S\214"
          L9_1 = L5_1
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if not L6_1 then
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L3_1
            L8_1 = "\f\136\027gO\244"
            L9_1 = L5_1
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if not L6_1 then
              L6_1 = string
              L6_1 = L6_1.find
              L7_1 = L3_1
              L8_1 = "\1720*\230\248="
              L9_1 = L5_1
              L10_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
              if not L6_1 then
                goto lbl_92
              end
            end
          end
        end
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        do return L6_1 end
        ::lbl_92::
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L3_1
        L8_1 = "\\\000m\000s\000m\000p\000e\000n\000g\000.\000e\000x\000e\000"
        L9_1 = L5_1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L3_1
          L8_1 = "\\\000m\000s\000s\000e\000n\000s\000e\000.\000e\000x\000e\000"
          L9_1 = L5_1
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if not L6_1 then
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L3_1
            L8_1 = "\\\000s\000e\000n\000s\000e\000i\000r\000.\000e\000x\000e\000"
            L9_1 = L5_1
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if not L6_1 then
              L6_1 = string
              L6_1 = L6_1.find
              L7_1 = L3_1
              L8_1 = "\\\000s\000e\000n\000s\000e\000n\000d\000r\000.\000e\000x\000e\000"
              L9_1 = L5_1
              L10_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
              if not L6_1 then
                L6_1 = string
                L6_1 = L6_1.find
                L7_1 = L3_1
                L8_1 = "\\\000s\000e\000n\000s\000e\000c\000n\000c\000p\000r\000o\000x\000y\000.\000e\000x\000e\000"
                L9_1 = L5_1
                L10_1 = true
                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                if not L6_1 then
                  L6_1 = string
                  L6_1 = L6_1.find
                  L7_1 = L3_1
                  L8_1 = "\\\000s\000e\000n\000s\000e\000s\000a\000m\000p\000l\000e\000u\000p\000l\000o\000a\000d\000e\000r\000.\000e\000x\000e\000"
                  L9_1 = L5_1
                  L10_1 = true
                  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                  if not L6_1 then
                    goto lbl_149
                  end
                end
              end
            end
          end
        end
        L6_1 = mp
        L6_1 = L6_1.INFECTED
        return L6_1
      end
    end
  end
end
::lbl_149::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
