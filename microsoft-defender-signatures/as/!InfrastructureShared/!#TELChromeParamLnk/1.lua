local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_PATH
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L2_1 = L2_1(L3_1, L4_1)
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1, L1_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = 1
L5_1 = 17
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == "google chrome.lnk" then
  L3_1 = L0_1
  L2_1 = L0_1.find
  L4_1 = "\\microsoft\\internet explorer\\quick launch"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 == nil then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L0_1
    L4_1 = -20
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= "\\start menu\\programs" then
      L2_1 = string
      L2_1 = L2_1.sub
      L3_1 = L0_1
      L4_1 = -8
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 ~= "\\desktop" then
        goto lbl_48
      end
    end
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_48::
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
