local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L0_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "windows\\explorer.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\system32\\svchost.exe"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\\syswow64\\svchost.exe"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        goto lbl_39
      end
    end
  end
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
::lbl_39::
L1_1 = nil
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p2
end
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= nil then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L1_1 = L2_1.utf8p2
  end
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.utf8p2
      if L2_1 ~= nil then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L1_1 = L2_1.utf8p2
    end
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L2_1 = L2_1.utf8p2
        if L2_1 ~= nil then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[4]
          L1_1 = L2_1.utf8p2
      end
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[5]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[5]
          L2_1 = L2_1.utf8p2
          if L2_1 ~= nil then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[5]
            L1_1 = L2_1.utf8p2
        end
        else
          L2_1 = this_sigattrlog
          L2_1 = L2_1[6]
          L2_1 = L2_1.matched
          if L2_1 then
            L2_1 = this_sigattrlog
            L2_1 = L2_1[6]
            L2_1 = L2_1.utf8p2
            if L2_1 ~= nil then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[6]
              L1_1 = L2_1.utf8p2
          end
          else
            L2_1 = this_sigattrlog
            L2_1 = L2_1[7]
            L2_1 = L2_1.matched
            if L2_1 then
              L2_1 = this_sigattrlog
              L2_1 = L2_1[7]
              L2_1 = L2_1.utf8p2
              if L2_1 ~= nil then
                L2_1 = this_sigattrlog
                L2_1 = L2_1[7]
                L1_1 = L2_1.utf8p2
              end
            end
          end
        end
      end
    end
  end
end
L2_1 = string
L2_1 = L2_1.len
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 < 4 then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 ~= "cmd" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "%1"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetExecutablesFromCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = sysio
  L8_1 = L8_1.IsFileExists
  L9_1 = L7_1
  L8_1 = L8_1(L9_1)
  if L8_1 then
    L8_1 = bm
    L8_1 = L8_1.add_related_file
    L9_1 = L7_1
    L8_1(L9_1)
  end
end
L3_1 = {}
L4_1 = table
L4_1 = L4_1.insert
L5_1 = L3_1
L6_1 = L1_1
L4_1(L5_1, L6_1)
L4_1 = MpCommon
L4_1 = L4_1.SetPersistContextNoPath
L5_1 = "UACBypassExp.T!regset"
L6_1 = L3_1
L7_1 = 10
L4_1(L5_1, L6_1, L7_1)
L4_1 = TrackPidAndTechniqueBM
L5_1 = "BM"
L6_1 = "T1548.002"
L7_1 = "uac_bypass_src"
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
