local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = pcall
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L0_1, L1_1 = L0_1(L1_1)
if L0_1 and L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L3_1 = L1_1.command_line
    if L3_1 ~= nil then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = L3_1
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "teamviewer"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L5_1 = L3_1
        L4_1 = L3_1.find
        L6_1 = "g2mcomm.exe"
        L4_1 = L4_1(L5_1, L6_1)
        if not L4_1 then
          L5_1 = L3_1
          L4_1 = L3_1.find
          L6_1 = "teams"
          L7_1 = 1
          L8_1 = true
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L5_1 = L3_1
            L4_1 = L3_1.find
            L6_1 = "discord.exe"
            L4_1 = L4_1(L5_1, L6_1)
            if not L4_1 then
              L5_1 = L3_1
              L4_1 = L3_1.find
              L6_1 = "explorer.exe"
              L4_1 = L4_1(L5_1, L6_1)
              if not L4_1 then
                L5_1 = L3_1
                L4_1 = L3_1.find
                L6_1 = "lunc.exe"
                L4_1 = L4_1(L5_1, L6_1)
                if not L4_1 then
                  L5_1 = L3_1
                  L4_1 = L3_1.find
                  L6_1 = "lync.exe"
                  L4_1 = L4_1(L5_1, L6_1)
                  if not L4_1 then
                    L5_1 = L3_1
                    L4_1 = L3_1.find
                    L6_1 = "youdaodict.exe"
                    L4_1 = L4_1(L5_1, L6_1)
                    if not L4_1 then
                      L5_1 = L3_1
                      L4_1 = L3_1.find
                      L6_1 = "gitkraken.exe"
                      L4_1 = L4_1(L5_1, L6_1)
                      if not L4_1 then
                        goto lbl_72
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    ::lbl_72::
    L4_1 = IsTacticObservedForPid
    L5_1 = L2_1
    L6_1 = "processinjection_target"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = GetTaintLevelHR
      L4_1 = L4_1()
      if L4_1 ~= nil or L4_1 == "Medium" or L4_1 == "High" then
        L5_1 = TrackPidAndTechniqueBM
        L6_1 = "BM"
        L7_1 = "T1056.001"
        L8_1 = "keylog"
        L5_1(L6_1, L7_1, L8_1)
        L5_1 = mp
        L5_1 = L5_1.INFECTED
        return L5_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
