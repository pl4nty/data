local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L3_1 = L0_1
  L2_1 = L0_1.lower
  L2_1 = L2_1(L3_1)
  L3_1 = "\\start menu\\programs\\startup\\"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 ~= nil then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FNAME
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
if L1_1 ~= nil then
  L3_1 = L1_1
  L2_1 = L1_1.lower
  L2_1 = L2_1(L3_1)
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "^flx%x%x%x%x?%.lnk$"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 == nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "^flx%x%x%x%x?%.tmp$"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == nil then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "^@?%x%x%x%x%x%x%x%x%x%x%x%x%.lnk$"
      L3_1 = L3_1(L4_1, L5_1)
      if L3_1 == nil and L2_1 ~= "zlighthouseregisterieplugin.lnk" and L2_1 ~= "microsoft-teamsaddin.lnk" then
        goto lbl_61
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
::lbl_61::
L2_1 = mp
L2_1 = L2_1.GetLnkInfo
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.BasePath
  if L3_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1.BasePath
    L5_1 = L4_1
    L4_1 = L4_1.lower
    L4_1 = L4_1(L5_1)
    L5_1 = "\\regsvr32.exe"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= nil then
      L3_1 = L2_1.Arguments
      if L3_1 ~= nil then
        L3_1 = L2_1.Arguments
        L4_1 = L3_1
        L3_1 = L3_1.lower
        L3_1 = L3_1(L4_1)
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L3_1
        L6_1 = ".cpp"
        L7_1 = 1
        L8_1 = true
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if L4_1 == nil then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L3_1
          L6_1 = ".ocx"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if L4_1 == nil then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L3_1
            L6_1 = "redemption.dll"
            L7_1 = 1
            L8_1 = true
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if L4_1 == nil then
              L4_1 = mp
              L4_1 = L4_1.INFECTED
              return L4_1
            end
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
