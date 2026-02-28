local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = "remote_file_created_taint"
L1_1 = {}
L2_1 = {}
L3_1 = "/bin/python"
L4_1 = "/bin/pip"
L2_1[1] = L3_1
L2_1[2] = L4_1
L3_1 = {}
L4_1 = "/bin/python"
L5_1 = "-m pip"
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = {}
L5_1 = "/bin/python"
L6_1 = "/bin/yum"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = {}
L6_1 = "/bin/ruby"
L7_1 = "/opt/microsoft/omsagent"
L5_1[1] = L6_1
L5_1[2] = L7_1
L6_1 = {}
L7_1 = "/opt/dsc/bin/dsc_host"
L8_1 = ""
L6_1[1] = L7_1
L6_1[2] = L8_1
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[27]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[27]
  L2_1 = L3_1.utf8p1
end
if L2_1 ~= nil then
  L3_1 = bm
  L3_1 = L3_1.get_current_process_startup_info
  L3_1 = L3_1()
  L4_1 = bm
  L4_1 = L4_1.get_imagepath
  L4_1 = L4_1()
  if L3_1 ~= nil then
    L5_1 = L3_1.ppid
    if L5_1 ~= nil and L4_1 ~= nil then
      L5_1 = L3_1.command_line
      if L5_1 ~= nil then
        L5_1 = ipairs
        L6_1 = L1_1
        L5_1, L6_1, L7_1 = L5_1(L6_1)
        for L8_1, L9_1 in L5_1, L6_1, L7_1 do
          L10_1 = L9_1[1]
          L11_1 = L9_1[2]
          L12_1 = string
          L12_1 = L12_1.find
          L13_1 = L4_1
          L14_1 = L10_1
          L15_1 = 1
          L16_1 = true
          L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
          if L12_1 then
            L12_1 = string
            L12_1 = L12_1.find
            L13_1 = L3_1.command_line
            L14_1 = L11_1
            L15_1 = 1
            L16_1 = true
            L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
            if L12_1 then
              L12_1 = mp
              L12_1 = L12_1.CLEAN
              return L12_1
            end
          end
        end
        L5_1 = taint
        L6_1 = L2_1
        L7_1 = L0_1
        L8_1 = 3600
        L5_1(L6_1, L7_1, L8_1)
        L5_1 = TrackPidAndTechniqueBM
        L6_1 = "BM"
        L7_1 = "T1105"
        L8_1 = "CommandAndControl"
        L5_1(L6_1, L7_1, L8_1)
        L5_1 = AppendToRollingQueue
        L6_1 = "queue_pid_taintfactory_a"
        L7_1 = L3_1.ppid
        L8_1 = 1
        L9_1 = 600
        L5_1(L6_1, L7_1, L8_1, L9_1)
        L5_1 = bm
        L5_1 = L5_1.get_process_relationships
        L6_1 = L3_1.ppid
        L5_1, L6_1 = L5_1(L6_1)
        L7_1 = ipairs
        L8_1 = L5_1
        L7_1, L8_1, L9_1 = L7_1(L8_1)
        for L10_1, L11_1 in L7_1, L8_1, L9_1 do
          L12_1 = bm
          L12_1 = L12_1.add_related_process
          L13_1 = L11_1.ppid
          L12_1(L13_1)
          L12_1 = TrackPidAndTechniqueBM
          L13_1 = L11_1.ppid
          L14_1 = "T1105"
          L15_1 = "CommandAndControl"
          L12_1(L13_1, L14_1, L15_1)
        end
        L7_1 = addRelatedProcess
        L7_1()
        L7_1 = reportRelatedBmHits
        L7_1()
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
