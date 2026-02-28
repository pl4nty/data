local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L1_1 = mp
  L1_1 = L1_1.GetExecutablesFromCommandLine
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  L2_1 = ipairs
  L3_1 = L1_1
  L2_1, L3_1, L4_1 = L2_1(L3_1)
  for L5_1, L6_1 in L2_1, L3_1, L4_1 do
    if L6_1 ~= nil and L6_1 ~= "" then
      L7_1 = StringEndsWith
      L8_1 = L6_1
      L9_1 = ".js"
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 then
        L7_1 = mp
        L7_1 = L7_1.ContextualExpandEnvironmentVariables
        L8_1 = L6_1
        L7_1 = L7_1(L8_1)
        L6_1 = L7_1
        L7_1 = sysio
        L7_1 = L7_1.IsFileExists
        L8_1 = L6_1
        L7_1 = L7_1(L8_1)
        if L7_1 then
          L7_1 = mp
          L7_1 = L7_1.GetMotwReferrerUrlForFile
          L8_1 = L6_1
          L7_1, L8_1 = L7_1(L8_1)
          if not L7_1 then
            L9_1 = mp
            L9_1 = L9_1.CLEAN
            return L9_1
          end
          if L8_1 then
            L9_1 = StringStartsWith
            L10_1 = L8_1
            L11_1 = "http"
            L9_1 = L9_1(L10_1, L11_1)
            if not L9_1 then
              L9_1 = StringStartsWith
              L10_1 = L8_1
              L11_1 = "www"
              L9_1 = L9_1(L10_1, L11_1)
              if not L9_1 then
                goto lbl_92
              end
            end
          end
          L9_1 = mp
          L9_1 = L9_1.CLEAN
          do return L9_1 end
          ::lbl_92::
          L9_1 = sysio
          L9_1 = L9_1.IsFileExists
          L10_1 = L8_1
          L9_1 = L9_1(L10_1)
          if L9_1 then
            L9_1 = mp
            L9_1 = L9_1.INFECTED
            return L9_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
