local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = false
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L0_1.image_path
  L2_1 = L2_1(L3_1)
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "\\explorer.exe"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 then
    L1_1 = true
  end
  L3_1 = L0_1.ppid
  if L3_1 then
    L3_1 = IsKeyInRollingQueue
    L4_1 = "IsProcessChainViaRUNMRU"
    L5_1 = L0_1.ppid
    L6_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if L3_1 then
      L1_1 = true
    end
  end
  L3_1 = mp
  L3_1 = L3_1.GetParentProcInfo
  L4_1 = L0_1.ppid
  L3_1 = L3_1(L4_1)
  if L3_1 ~= nil then
    L4_1 = L3_1.ppid
    if L4_1 then
      L4_1 = IsKeyInRollingQueue
      L5_1 = "IsProcessChainViaRUNMRU"
      L6_1 = L3_1.ppid
      L7_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1)
      if L4_1 then
        L1_1 = true
      end
    end
  end
  if not L1_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.get_mpattribute
  L5_1 = "MpCmdLineFoundB64"
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.GetScannedPPID
  L4_1 = L4_1()
  if L4_1 == "" or L4_1 == nil then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.GetProcessCommandLine
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.lower
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  L6_1 = string
  L6_1 = L6_1.gsub
  L7_1 = L5_1
  L8_1 = "%^"
  L9_1 = ""
  L6_1 = L6_1(L7_1, L8_1, L9_1)
  L5_1 = L6_1
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L5_1
  L8_1 = "iwr "
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if not L6_1 then
    L6_1 = string
    L6_1 = L6_1.find
    L7_1 = L5_1
    L8_1 = "iwr("
    L9_1 = 1
    L10_1 = true
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if not L6_1 then
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L5_1
      L8_1 = "irm "
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if not L6_1 then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L5_1
        L8_1 = "irm("
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if not L6_1 then
          L6_1 = string
          L6_1 = L6_1.find
          L7_1 = L5_1
          L8_1 = "curl"
          L9_1 = 1
          L10_1 = true
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
          if not L6_1 then
            L6_1 = string
            L6_1 = L6_1.find
            L7_1 = L5_1
            L8_1 = "wget"
            L9_1 = 1
            L10_1 = true
            L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
            if not L6_1 then
              L6_1 = string
              L6_1 = L6_1.find
              L7_1 = L5_1
              L8_1 = "http"
              L9_1 = 1
              L10_1 = true
              L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
              if not L6_1 then
                L6_1 = string
                L6_1 = L6_1.find
                L7_1 = L5_1
                L8_1 = ".gettype("
                L9_1 = 1
                L10_1 = true
                L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                if not L6_1 then
                  L6_1 = string
                  L6_1 = L6_1.find
                  L7_1 = L5_1
                  L8_1 = ").content"
                  L9_1 = 1
                  L10_1 = true
                  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                  if not L6_1 then
                    L6_1 = string
                    L6_1 = L6_1.find
                    L7_1 = L5_1
                    L8_1 = "finger"
                    L9_1 = 1
                    L10_1 = true
                    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                    if not L6_1 then
                      L6_1 = string
                      L6_1 = L6_1.find
                      L7_1 = L5_1
                      L8_1 = "nslookup"
                      L9_1 = 1
                      L10_1 = true
                      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                      if not L6_1 then
                        L6_1 = string
                        L6_1 = L6_1.find
                        L7_1 = L5_1
                        L8_1 = " /c set "
                        L9_1 = 1
                        L10_1 = true
                        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
                        if not L6_1 then
                          goto lbl_205
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
  end
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
::lbl_205::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
