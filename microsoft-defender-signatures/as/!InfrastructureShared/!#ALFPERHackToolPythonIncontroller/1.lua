local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:IncontrollerA"
L0_1 = L0_1(L1_1)
L0_1 = #L0_1
if not (5 <= L0_1) then
  L0_1 = mp
  L0_1 = L0_1.enum_mpattributesubstring
  L1_1 = "SCPT:IncontrollerB"
  L0_1 = L0_1(L1_1)
  L0_1 = #L0_1
  if L0_1 ~= 4 then
    L0_1 = mp
    L0_1 = L0_1.enum_mpattributesubstring
    L1_1 = "SCPT:IncontrollerC"
    L0_1 = L0_1(L1_1)
    L0_1 = #L0_1
    if L0_1 == 4 then
      L0_1 = mp
      L0_1 = L0_1.enum_mpattributesubstring
      L1_1 = "SCPT:IncontrollerD"
      L0_1 = L0_1(L1_1)
      L0_1 = #L0_1
      if 0 < L0_1 then
        goto lbl_85
      end
    end
    L0_1 = mp
    L0_1 = L0_1.enum_mpattributesubstring
    L1_1 = "SCPT:IncontrollerE"
    L0_1 = L0_1(L1_1)
    L0_1 = #L0_1
    if L0_1 ~= 5 then
      L0_1 = mp
      L0_1 = L0_1.enum_mpattributesubstring
      L1_1 = "SCPT:IncontrollerF"
      L0_1 = L0_1(L1_1)
      L0_1 = #L0_1
      if L0_1 == 1 then
        L0_1 = mp
        L0_1 = L0_1.enum_mpattributesubstring
        L1_1 = "SCPT:IncontrollerG"
        L0_1 = L0_1(L1_1)
        L0_1 = #L0_1
        if 0 < L0_1 then
          goto lbl_85
        end
      end
      L0_1 = mp
      L0_1 = L0_1.enum_mpattributesubstring
      L1_1 = "SCPT:IncontrollerH"
      L0_1 = L0_1(L1_1)
      L0_1 = #L0_1
      if not (4 < L0_1) then
        L0_1 = mp
        L0_1 = L0_1.enum_mpattributesubstring
        L1_1 = "SCPT:IncontrollerI"
        L0_1 = L0_1(L1_1)
        L0_1 = #L0_1
        if L0_1 == 5 then
          L0_1 = mp
          L0_1 = L0_1.enum_mpattributesubstring
          L1_1 = "SCPT:IncontrollerJ"
          L0_1 = L0_1(L1_1)
          L0_1 = #L0_1
          if 0 < L0_1 then
            goto lbl_85
          end
        end
        L0_1 = mp
        L0_1 = L0_1.enum_mpattributesubstring
        L1_1 = "SCPT:IncontrollerK"
        L0_1 = L0_1(L1_1)
        L0_1 = #L0_1
        if L0_1 ~= 3 then
          L0_1 = mp
          L0_1 = L0_1.enum_mpattributesubstring
          L1_1 = "SCPT:IncontrollerL"
          L0_1 = L0_1(L1_1)
          L0_1 = #L0_1
          if not (4 < L0_1) then
            goto lbl_88
          end
        end
      end
    end
  end
end
::lbl_85::
L0_1 = mp
L0_1 = L0_1.INFECTED
do return L0_1 end
::lbl_88::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
