local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "SLF:HackTool:"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattributesubstring
  L1_1 = "SLF:VirTool:"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.get_mpattributesubstring
    L1_1 = "ALF:HackTool:"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.get_mpattributesubstring
      L1_1 = "ALF:VirTool:"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        goto lbl_65
      end
    end
  end
end
L0_1 = MpCommon
L0_1 = L0_1.PathToWin32Path
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 9) then
    goto lbl_41
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_41::
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "(.+)\\[^\\]+$"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = ":\\programdata$"
L4_1 = ":\\perflogs$"
L5_1 = ":\\users\\.*\\music$"
L6_1 = ":windows\\temp$"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L6_1 = false
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_65::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
