local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1
L2_1 = "remote_file_created_taint"
L3_1 = {}
L4_1 = {}
L5_1 = "/bin/python"
L6_1 = "/bin/pip"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = {}
L6_1 = "/bin/python"
L7_1 = "-m pip"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = "/bin/python"
L8_1 = "/bin/yum"
L6_1[1] = L7_1
L6_1[2] = L8_1
L7_1 = {}
L8_1 = "/bin/ruby"
L9_1 = "/opt/microsoft/omsagent"
L7_1[1] = L8_1
L7_1[2] = L9_1
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[2]
  L1_1 = L4_1.utf8p1
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[3]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[3]
    L1_1 = L4_1.utf8p1
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[4]
      L1_1 = L4_1.utf8p1
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[6]
        L1_1 = L4_1.utf8p1
      else
        L4_1 = this_sigattrlog
        L4_1 = L4_1[5]
        L4_1 = L4_1.matched
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[5]
          L1_1 = L4_1.utf8p1
        else
          L4_1 = this_sigattrlog
          L4_1 = L4_1[7]
          L4_1 = L4_1.matched
          if L4_1 then
            L4_1 = this_sigattrlog
            L4_1 = L4_1[7]
            L1_1 = L4_1.utf8p1
          end
        end
      end
    end
  end
end
L4_1 = this_sigattrlog
L4_1 = L4_1[9]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[9]
  L0_1 = L4_1.utf8p1
end
if L1_1 ~= nil and L0_1 ~= nil then
  L4_1 = isTainted
  L5_1 = L1_1
  L6_1 = L2_1
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = bm
    L4_1 = L4_1.get_current_process_startup_info
    L4_1 = L4_1()
    L5_1 = bm
    L5_1 = L5_1.get_imagepath
    L5_1 = L5_1()
    if L4_1 ~= nil then
      L6_1 = L4_1.ppid
      if L6_1 ~= nil and L5_1 ~= nil then
        L6_1 = L4_1.command_line
        if L6_1 ~= nil then
          L6_1 = ipairs
          L7_1 = L3_1
          L6_1, L7_1, L8_1 = L6_1(L7_1)
          for L9_1, L10_1 in L6_1, L7_1, L8_1 do
            L11_1 = L10_1[1]
            L12_1 = L10_1[2]
            L13_1 = string
            L13_1 = L13_1.find
            L14_1 = L5_1
            L15_1 = L11_1
            L16_1 = 1
            L17_1 = true
            L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
            if L13_1 then
              L13_1 = string
              L13_1 = L13_1.find
              L14_1 = L4_1.command_line
              L15_1 = L12_1
              L16_1 = 1
              L17_1 = true
              L13_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
              if L13_1 then
                L13_1 = mp
                L13_1 = L13_1.CLEAN
                return L13_1
              end
            end
          end
          L6_1 = taint
          L7_1 = L0_1
          L8_1 = L2_1
          L9_1 = 3600
          L6_1(L7_1, L8_1, L9_1)
          L6_1 = TrackPidAndTechniqueBM
          L7_1 = "BM"
          L8_1 = "T1105"
          L9_1 = "CommandAndControl"
          L6_1(L7_1, L8_1, L9_1)
          L6_1 = AppendToRollingQueue
          L7_1 = "queue_pid_taintfactory_a"
          L8_1 = L4_1.ppid
          L9_1 = 1
          L10_1 = 600
          L6_1(L7_1, L8_1, L9_1, L10_1)
          L6_1 = bm
          L6_1 = L6_1.get_process_relationships
          L7_1 = L4_1.ppid
          L6_1, L7_1 = L6_1(L7_1)
          L8_1 = ipairs
          L9_1 = L6_1
          L8_1, L9_1, L10_1 = L8_1(L9_1)
          for L11_1, L12_1 in L8_1, L9_1, L10_1 do
            L13_1 = bm
            L13_1 = L13_1.add_related_process
            L14_1 = L12_1.ppid
            L13_1(L14_1)
            L13_1 = TrackPidAndTechniqueBM
            L14_1 = L12_1.ppid
            L15_1 = "T1105"
            L16_1 = "CommandAndControl"
            L13_1(L14_1, L15_1, L16_1)
          end
          L8_1 = mp
          L8_1 = L8_1.INFECTED
          return L8_1
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
