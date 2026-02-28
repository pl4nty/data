local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L1_1 = this_sigattrlog
L1_1 = L1_1[8]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[8]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[8]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[9]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[9]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[9]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[10]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[10]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[10]
        L0_1 = L1_1.utf8p2
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[11]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[11]
        L1_1 = L1_1.utf8p2
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[11]
          L0_1 = L1_1.utf8p2
      end
      else
        L1_1 = this_sigattrlog
        L1_1 = L1_1[12]
        L1_1 = L1_1.matched
        if L1_1 then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[12]
          L1_1 = L1_1.utf8p2
          if L1_1 ~= nil then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[12]
            L0_1 = L1_1.utf8p2
        end
        else
          L1_1 = this_sigattrlog
          L1_1 = L1_1[13]
          L1_1 = L1_1.matched
          if L1_1 then
            L1_1 = this_sigattrlog
            L1_1 = L1_1[13]
            L1_1 = L1_1.utf8p2
            if L1_1 ~= nil then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[13]
              L0_1 = L1_1.utf8p2
          end
          else
            L1_1 = this_sigattrlog
            L1_1 = L1_1[14]
            L1_1 = L1_1.matched
            if L1_1 then
              L1_1 = this_sigattrlog
              L1_1 = L1_1[14]
              L1_1 = L1_1.utf8p2
              if L1_1 ~= nil then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[14]
                L0_1 = L1_1.utf8p2
            end
            else
              L1_1 = this_sigattrlog
              L1_1 = L1_1[15]
              L1_1 = L1_1.matched
              if L1_1 then
                L1_1 = this_sigattrlog
                L1_1 = L1_1[15]
                L1_1 = L1_1.utf8p2
                if L1_1 ~= nil then
                  L1_1 = this_sigattrlog
                  L1_1 = L1_1[15]
                  L0_1 = L1_1.utf8p2
                end
              end
            end
          end
        end
      end
    end
  end
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = {}
L2_1 = "\\appdata\\"
L3_1 = "\\start menu\\programs\\startup\\"
L4_1 = "\\local\\temp\\"
L5_1 = "\\programdata\\"
L6_1 = "\\public\\"
L7_1 = "\\microsoft\\templates\\"
L8_1 = "\\word\\startup\\"
L9_1 = "\\excel\\xlstart\\"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L2_1 = false
L3_1 = ipairs
L4_1 = L1_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L0_1
  L10_1 = L7_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 then
    L2_1 = true
    break
  end
end
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L4_1 = isnull
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "\\windows defender\\msmpeng.exe"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L4_1 = bm
L4_1 = L4_1.add_related_string
L5_1 = "ChildCmdline"
L6_1 = L0_1
L7_1 = bm
L7_1 = L7_1.RelatedStringBMReport
L4_1(L5_1, L6_1, L7_1)
L4_1 = add_parents
L4_1()
L4_1 = TrackPidAndTechniqueBM
L5_1 = "BM"
L6_1 = "T1203"
L7_1 = "cve_2025_8088_archive_exec_chain"
L4_1(L5_1, L6_1, L7_1)
L4_1 = TrackPidAndTechniqueBM
L5_1 = "BM"
L6_1 = "T1059"
L7_1 = "archive_post_extract_exec"
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
