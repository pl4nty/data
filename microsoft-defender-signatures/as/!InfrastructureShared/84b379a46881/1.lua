local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1

function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  if A1_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = #A0_2
  if L2_2 <= 0 then
    L2_2 = false
    return L2_2
  end
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = A0_2[L5_2]
    if L6_2 == A1_2 then
      L6_2 = true
      return L6_2
    end
  end
  L2_2 = false
  return L2_2
end

IsArrayMember = L0_1
L0_1 = nil
L1_1 = this_sigattrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = mp
    L2_1 = L2_1.ContextualExpandEnvironmentVariables
    L3_1 = this_sigattrlog
    L3_1 = L3_1[4]
    L3_1 = L3_1.utf8p2
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L2_1(L3_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
    L0_1 = L1_1
end
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = {}
L2_1 = "winword.exe"
L3_1 = "mspub.exe"
L4_1 = "excel.exe"
L5_1 = "powerpnt.exe"
L6_1 = "powershell.exe"
L7_1 = "cscript.exe"
L8_1 = "wscript.exe"
L9_1 = "iexplore.exe"
L10_1 = "microsoftedge.exe"
L11_1 = "microsoftedgecp.exe"
L12_1 = "chrome.exe"
L13_1 = "firefox.exe"
L14_1 = "python.exe"
L15_1 = "rundll32.exe"
L16_1 = "regsvr32.exe"
L17_1 = "psexesvc.exe"
L18_1 = "psexec.exe"
L19_1 = "services.exe"
L20_1 = "wininit.exe"
L21_1 = "wmic.exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L1_1[15] = L16_1
L1_1[16] = L17_1
L1_1[17] = L18_1
L1_1[18] = L19_1
L1_1[19] = L20_1
L1_1[20] = L21_1
L2_1 = IsProcNameInParentProcessTree
L3_1 = "BM"
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = {}
L3_1 = 0
L4_1 = 0
L5_1 = string
L5_1 = L5_1.gmatch
L6_1 = L0_1
L7_1 = "[^&]+"
L5_1, L6_1, L7_1 = L5_1(L6_1, L7_1)
for L8_1 in L5_1, L6_1, L7_1 do
  L3_1 = L3_1 + 1
  L9_1 = table
  L9_1 = L9_1.insert
  L10_1 = L2_1
  L11_1 = {}
  L9_1(L10_1, L11_1)
  L4_1 = 0
  L9_1 = string
  L9_1 = L9_1.gmatch
  L10_1 = L8_1
  L11_1 = "%S+"
  L9_1, L10_1, L11_1 = L9_1(L10_1, L11_1)
  for L12_1 in L9_1, L10_1, L11_1 do
    L4_1 = L4_1 + 1
    L13_1 = L2_1[L3_1]
    L14_1 = string
    L14_1 = L14_1.lower
    L15_1 = L12_1
    L14_1 = L14_1(L15_1)
    L13_1[L4_1] = L14_1
  end
end
L5_1 = {}
L6_1 = 0
L7_1 = 1
L8_1 = #L2_1
L9_1 = 1
for L10_1 = L7_1, L8_1, L9_1 do
  L11_1 = 0
  L12_1 = 1
  L13_1 = L2_1[L10_1]
  L13_1 = #L13_1
  L14_1 = 1
  for L15_1 = L12_1, L13_1, L14_1 do
    if L6_1 == 0 then
      if L11_1 == 0 then
        L16_1 = string
        L16_1 = L16_1.sub
        L17_1 = L2_1[L10_1]
        L17_1 = L17_1[L15_1]
        L18_1 = -9
        L16_1 = L16_1(L17_1, L18_1)
        if L16_1 ~= "bitsadmin" then
          L16_1 = string
          L16_1 = L16_1.sub
          L17_1 = L2_1[L10_1]
          L17_1 = L17_1[L15_1]
          L18_1 = -13
          L16_1 = L16_1(L17_1, L18_1)
          if L16_1 ~= "bitsadmin.exe" then
            goto lbl_126
          end
        end
        L11_1 = 1000
      else
        ::lbl_126::
        if L11_1 == 1000 then
          L16_1 = L2_1[L10_1]
          L16_1 = L16_1[L15_1]
          if L16_1 == "/transfer" then
            goto lbl_138
          end
        end
        if L11_1 == 1000 then
          L16_1 = L2_1[L10_1]
          L16_1 = L16_1[L15_1]
          if L16_1 == "/addfile" then
            ::lbl_138::
            L11_1 = 2000
        end
        else
          if L11_1 == 2000 then
            L16_1 = L2_1[L10_1]
            L16_1 = L16_1[L15_1]
            if L16_1 == "/upload" then
              L11_1 = -1
              L6_1 = -1
          end
          else
            if L11_1 == 2000 then
              L16_1 = string
              L16_1 = L16_1.sub
              L17_1 = L2_1[L10_1]
              L17_1 = L17_1[L15_1]
              L18_1 = 1
              L19_1 = 4
              L16_1 = L16_1(L17_1, L18_1, L19_1)
              if L16_1 == "http" then
                L11_1 = 3000
            end
            elseif L11_1 == 3000 then
              L16_1 = string
              L16_1 = L16_1.match
              L17_1 = L2_1[L10_1]
              L17_1 = L17_1[L15_1]
              L18_1 = "\\\\[^ ]\\C$[^ ]* [^ ]+"
              L16_1 = L16_1(L17_1, L18_1)
              if L16_1 ~= nil then
                L11_1 = 4000
                L6_1 = 1
                L16_1 = #L5_1
                L16_1 = L16_1 + 1
                L17_1 = L2_1[L10_1]
                L17_1 = L17_1[L15_1]
                L5_1[L16_1] = L17_1
              end
            end
          end
        end
      end
    end
    if L6_1 == 1 then
      if L11_1 == 0 and L15_1 == 1 then
        L16_1 = L2_1[L10_1]
        L16_1 = L16_1[L15_1]
        if L16_1 == "start" then
          L11_1 = 1000
      end
      else
        if L11_1 == 1000 then
          L16_1 = string
          L16_1 = L16_1.match
          L17_1 = L2_1[L10_1]
          L17_1 = L17_1[L15_1]
          L18_1 = "\\\\[^ ]\\C$[^ ]* [^ ]+"
          L16_1 = L16_1(L17_1, L18_1)
          if L16_1 ~= nil then
            L16_1 = IsArrayMember
            L17_1 = L5_1
            L18_1 = L2_1[L10_1]
            L18_1 = L18_1[L15_1]
            L16_1 = L16_1(L17_1, L18_1)
            if L16_1 == true then
              L16_1 = string
              L16_1 = L16_1.sub
              L17_1 = L2_1[L10_1]
              L17_1 = L17_1[L15_1]
              L18_1 = -4
              L16_1 = L16_1(L17_1, L18_1)
              if L16_1 == ".exe" then
                goto lbl_243
              end
            end
          end
        end
        if L11_1 == 0 and L15_1 == 1 then
          L16_1 = string
          L16_1 = L16_1.match
          L17_1 = L2_1[L10_1]
          L17_1 = L17_1[L15_1]
          L18_1 = "\\\\[^ ]\\C$[^ ]* [^ ]+"
          L16_1 = L16_1(L17_1, L18_1)
          if L16_1 ~= nil then
            L16_1 = IsArrayMember
            L17_1 = L5_1
            L18_1 = L2_1[L10_1]
            L18_1 = L18_1[L15_1]
            L16_1 = L16_1(L17_1, L18_1)
            if L16_1 == true then
              L16_1 = string
              L16_1 = L16_1.sub
              L17_1 = L2_1[L10_1]
              L17_1 = L17_1[L15_1]
              L18_1 = -4
              L16_1 = L16_1(L17_1, L18_1)
              if L16_1 == ".exe" then
                ::lbl_243::
                L11_1 = 9999
                L6_1 = 9999
            end
          end
        end
        else
          if L11_1 == 0 and 1 < L15_1 then
            L16_1 = string
            L16_1 = L16_1.match
            L17_1 = L2_1[L10_1]
            L17_1 = L17_1[L15_1]
            L18_1 = "\\\\[^ ]\\C$[^ ]* [^ ]+"
            L16_1 = L16_1(L17_1, L18_1)
            if L16_1 ~= nil then
              L16_1 = IsArrayMember
              L17_1 = L5_1
              L18_1 = L2_1[L10_1]
              L18_1 = L18_1[L15_1]
              L16_1 = L16_1(L17_1, L18_1)
              if L16_1 == true then
                L11_1 = 2000
            end
          end
          elseif L11_1 == 2000 and 1 < L15_1 then
            L16_1 = string
            L16_1 = L16_1.match
            L17_1 = L2_1[L10_1]
            L17_1 = L17_1[L15_1]
            L18_1 = "\\\\[^ ]\\C$[^ ]* [^ ]+"
            L16_1 = L16_1(L17_1, L18_1)
            if L16_1 ~= nil then
              L16_1 = IsArrayMember
              L17_1 = L5_1
              L18_1 = L2_1[L10_1]
              L18_1 = L18_1[L15_1]
              L16_1 = L16_1(L17_1, L18_1)
              if L16_1 == false then
                L11_1 = 3000
                L16_1 = #L5_1
                L16_1 = L16_1 + 1
                L17_1 = L2_1[L10_1]
                L17_1 = L17_1[L15_1]
                L5_1[L16_1] = L17_1
              end
            end
          end
        end
      end
    end
    if L6_1 == 9999 then
      L16_1 = mp
      L16_1 = L16_1.INFECTED
      return L16_1
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
