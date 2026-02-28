local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1

function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  L1_2[".bat"] = true
  L1_2[".cmd"] = true
  L1_2[".ps1"] = true
  L2_2 = A0_2.procInfo
  if L2_2 then
    L2_2 = A0_2.procInfo
    L2_2 = L2_2.cmdline
    if L2_2 then
      L2_2 = bm_AddRelatedFileFromCommandLine
      L3_2 = A0_2.procInfo
      L3_2 = L3_2.cmdline
      L4_2 = L3_2
      L3_2 = L3_2.lower
      L3_2 = L3_2(L4_2)
      L4_2 = L1_2
      L5_2 = nil
      L6_2 = 1
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
    L2_2 = A0_2.procInfo
    L2_2 = L2_2.shellScripts
    if L2_2 then
      L2_2 = ipairs
      L3_2 = A0_2.procInfo
      L3_2 = L3_2.shellScripts
      L2_2, L3_2, L4_2 = L2_2(L3_2)
      for L5_2, L6_2 in L2_2, L3_2, L4_2 do
        L7_2 = sysio
        L7_2 = L7_2.IsFileExists
        L8_2 = L6_2
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L7_2 = bm
          L7_2 = L7_2.add_related_file
          L8_2 = L6_2
          L7_2(L8_2)
        end
      end
    end
  end
  L2_2 = A0_2.parents
  if L2_2 then
    L2_2 = ipairs
    L3_2 = A0_2.parents
    L2_2, L3_2, L4_2 = L2_2(L3_2)
    for L5_2, L6_2 in L2_2, L3_2, L4_2 do
      L7_2 = L6_2.cmdline
      if L7_2 then
        L7_2 = bm_AddRelatedFileFromCommandLine
        L8_2 = L6_2.cmdline
        L9_2 = L8_2
        L8_2 = L8_2.lower
        L8_2 = L8_2(L9_2)
        L9_2 = L1_2
        L10_2 = nil
        L11_2 = 1
        L7_2(L8_2, L9_2, L10_2, L11_2)
      end
      L7_2 = L6_2.shellScripts
      if L7_2 then
        L7_2 = ipairs
        L8_2 = L6_2.shellScripts
        L7_2, L8_2, L9_2 = L7_2(L8_2)
        for L10_2, L11_2 in L7_2, L8_2, L9_2 do
          L12_2 = sysio
          L12_2 = L12_2.IsFileExists
          L13_2 = L11_2
          L12_2 = L12_2(L13_2)
          if L12_2 then
            L12_2 = bm
            L12_2 = L12_2.add_related_file
            L13_2 = L11_2
            L12_2(L13_2)
          end
        end
      end
    end
  end
end

function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L2_2 = GetRollingQueue
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil then
    L3_2 = type
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if L3_2 == "table" then
      L4_2 = A0_2
      L3_2 = A0_2.lower
      L3_2 = L3_2(L4_2)
      L5_2 = L3_2
      L4_2 = L3_2.match
      L6_2 = "%.([^%.]+)$"
      L4_2 = L4_2(L5_2, L6_2)
      L5_2 = pairs
      L6_2 = L2_2
      L5_2, L6_2, L7_2 = L5_2(L6_2)
      for L8_2 in L5_2, L6_2, L7_2 do
        L9_2 = safeJsonDeserialize
        L10_2 = L2_2[L8_2]
        L10_2 = L10_2.key
        L9_2 = L9_2(L10_2)
        if L9_2 then
          L10_2 = L9_2.type
          if L10_2 then
            L10_2 = L9_2.event
            if L10_2 then
              L10_2 = L9_2.event
              L11_2 = L10_2
              L10_2 = L10_2.lower
              L10_2 = L10_2(L11_2)
              L11_2 = string
              L11_2 = L11_2.find
              L12_2 = L9_2.type
              L13_2 = "BM_Exclusion"
              L14_2 = 1
              L15_2 = true
              L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
              if L11_2 then
                L12_2 = L10_2
                L11_2 = L10_2.match
                L13_2 = "\\exclusions\\paths\\\\(.+)$"
                L11_2 = L11_2(L12_2, L13_2)
                if not L11_2 then
                  L12_2 = L10_2
                  L11_2 = L10_2.match
                  L13_2 = "\\exclusions\\processes\\\\(.+)$"
                  L11_2 = L11_2(L12_2, L13_2)
                end
                if L11_2 ~= nil then
                  L12_2 = MpCommon
                  L12_2 = L12_2.ExpandEnvironmentVariables
                  L13_2 = L11_2
                  L12_2 = L12_2(L13_2)
                  L11_2 = L12_2
                  L13_2 = L11_2
                  L12_2 = L11_2.lower
                  L12_2 = L12_2(L13_2)
                  L13_2 = L12_2
                  L12_2 = L12_2.gsub
                  L14_2 = "%."
                  L15_2 = "%%."
                  L12_2 = L12_2(L13_2, L14_2, L15_2)
                  L13_2 = L12_2
                  L12_2 = L12_2.gsub
                  L14_2 = "?"
                  L15_2 = "."
                  L12_2 = L12_2(L13_2, L14_2, L15_2)
                  L13_2 = L12_2
                  L12_2 = L12_2.gsub
                  L14_2 = "*"
                  L15_2 = "[^\\]+"
                  L12_2 = L12_2(L13_2, L14_2, L15_2)
                  L11_2 = L12_2
                  L13_2 = L3_2
                  L12_2 = L3_2.match
                  L14_2 = L11_2
                  L12_2 = L12_2(L13_2, L14_2)
                  if L12_2 then
                    L12_2 = bm
                    L12_2 = L12_2.add_related_string
                    L13_2 = "Tampering_Events"
                    L14_2 = L2_2[L8_2]
                    L14_2 = L14_2.key
                    L15_2 = bm
                    L15_2 = L15_2.RelatedStringBMReport
                    L12_2(L13_2, L14_2, L15_2)
                    L12_2 = L0_1
                    L13_2 = L9_2
                    L12_2(L13_2)
                    L12_2 = true
                    return L12_2
                  end
                end
                L13_2 = L10_2
                L12_2 = L10_2.match
                L14_2 = "\\exclusions\\extensions\\\\%W*(%w+)$"
                L12_2 = L12_2(L13_2, L14_2)
                if L12_2 ~= nil then
                  L14_2 = L12_2
                  L13_2 = L12_2.lower
                  L13_2 = L13_2(L14_2)
                  if L4_2 == L13_2 then
                    L13_2 = bm
                    L13_2 = L13_2.add_related_string
                    L14_2 = "Tampering_Events"
                    L15_2 = L2_2[L8_2]
                    L15_2 = L15_2.key
                    L16_2 = bm
                    L16_2 = L16_2.RelatedStringBMReport
                    L13_2(L14_2, L15_2, L16_2)
                    L13_2 = L0_1
                    L14_2 = L9_2
                    L13_2(L14_2)
                    L13_2 = true
                    return L13_2
                  end
                end
              else
                L11_2 = string
                L11_2 = L11_2.find
                L12_2 = L9_2.type
                L13_2 = "AMSI_Exclusion"
                L14_2 = 1
                L15_2 = true
                L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
                if L11_2 then
                  L11_2 = string
                  L11_2 = L11_2.gmatch
                  L12_2 = L10_2
                  L13_2 = "[^;]+"
                  L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
                  for L14_2 in L11_2, L12_2, L13_2 do
                    L16_2 = L14_2
                    L15_2 = L14_2.match
                    L17_2 = "path|(.+)$"
                    L15_2 = L15_2(L16_2, L17_2)
                    if not L15_2 then
                      L16_2 = L10_2
                      L15_2 = L10_2.match
                      L17_2 = "process|(.+)$"
                      L15_2 = L15_2(L16_2, L17_2)
                    end
                    if L15_2 ~= nil then
                      L16_2 = MpCommon
                      L16_2 = L16_2.ExpandEnvironmentVariables
                      L17_2 = L15_2
                      L16_2 = L16_2(L17_2)
                      L15_2 = L16_2
                      L17_2 = L15_2
                      L16_2 = L15_2.lower
                      L16_2 = L16_2(L17_2)
                      L17_2 = L16_2
                      L16_2 = L16_2.gsub
                      L18_2 = "%."
                      L19_2 = "%%."
                      L16_2 = L16_2(L17_2, L18_2, L19_2)
                      L17_2 = L16_2
                      L16_2 = L16_2.gsub
                      L18_2 = "?"
                      L19_2 = "."
                      L16_2 = L16_2(L17_2, L18_2, L19_2)
                      L17_2 = L16_2
                      L16_2 = L16_2.gsub
                      L18_2 = "*"
                      L19_2 = "[^\\]+"
                      L16_2 = L16_2(L17_2, L18_2, L19_2)
                      L15_2 = L16_2
                      L17_2 = L3_2
                      L16_2 = L3_2.match
                      L18_2 = L15_2
                      L16_2 = L16_2(L17_2, L18_2)
                      if L16_2 then
                        L16_2 = bm
                        L16_2 = L16_2.add_related_string
                        L17_2 = "Tampering_Events"
                        L18_2 = L2_2[L8_2]
                        L18_2 = L18_2.key
                        L19_2 = bm
                        L19_2 = L19_2.RelatedStringBMReport
                        L16_2(L17_2, L18_2, L19_2)
                        L16_2 = L0_1
                        L17_2 = L9_2
                        L16_2(L17_2)
                        L16_2 = true
                        return L16_2
                      end
                    end
                    L17_2 = L10_2
                    L16_2 = L10_2.match
                    L18_2 = "extension|%W*(%w+)$"
                    L16_2 = L16_2(L17_2, L18_2)
                    if L16_2 ~= nil then
                      L18_2 = L16_2
                      L17_2 = L16_2.lower
                      L17_2 = L17_2(L18_2)
                      if L4_2 == L17_2 then
                        L17_2 = bm
                        L17_2 = L17_2.add_related_string
                        L18_2 = "Tampering_Events"
                        L19_2 = L2_2[L8_2]
                        L19_2 = L19_2.key
                        L20_2 = bm
                        L20_2 = L20_2.RelatedStringBMReport
                        L17_2(L18_2, L19_2, L20_2)
                        L17_2 = L0_1
                        L18_2 = L9_2
                        L17_2(L18_2)
                        L17_2 = true
                        return L17_2
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L3_2 = false
  return L3_2
end

L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = "TamperingTracking"
L4_1 = L1_1
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = add_parents
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = reportSessionInformation
L4_1 = L4_1()
L5_1 = L4_1.User
if L5_1 then
  L5_1 = L4_1.User
  L5_1 = L5_1.UserName
  if L5_1 then
    L5_1 = L3_1
    L6_1 = "-"
    L7_1 = L4_1.User
    L7_1 = L7_1.UserName
    L3_1 = L5_1 .. L6_1 .. L7_1
    L5_1 = L1_1
    L6_1 = L2_1
    L7_1 = L3_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 then
      L5_1 = add_parents
      L5_1()
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
