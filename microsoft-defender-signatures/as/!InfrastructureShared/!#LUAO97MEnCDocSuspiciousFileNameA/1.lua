local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 10) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "documentindex%-%d%d%d%d+%-12%d%d2021%.xlsb"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "contractcopy%-%d%d%d%d+%-dec%-21%.xlsb"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "debt%-details%-%d%d%d%d+%-%d%d%d%d2021%.xlsm"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "service%-interrupt%-%d%d%d%d+%.xlsb"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "compliance%-report%-%d%d%d%d+%-mar%-%d%d+%.xlsb"
        L1_1 = L1_1(L2_1, L3_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "compliancerep%-%d%d%d%d+%-apr%-%d%d+%.xlsb"
          L1_1 = L1_1(L2_1, L3_1)
          if L1_1 == nil then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "applicationreject%-%d%d%d%d+%.xlsb"
            L1_1 = L1_1(L2_1, L3_1)
            if L1_1 == nil then
              goto lbl_69
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_69::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
