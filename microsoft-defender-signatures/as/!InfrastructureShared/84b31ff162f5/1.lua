local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = 3
L1_1 = 14
L2_1 = nil
L3_1 = "sys[tw][eo][mw][36%%]"
L4_1 = bm
L4_1 = L4_1.get_current_process_startup_info
L4_1 = L4_1()
L5_1 = isnull
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = isnull
  L6_1 = L4_1.ppid
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    goto lbl_21
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_21::
L5_1 = this_sigattrlog
L5_1 = L5_1[1]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = isnull
  L6_1 = this_sigattrlog
  L6_1 = L6_1[1]
  L6_1 = L6_1.utf8p1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L5_1 = isnull
    L6_1 = this_sigattrlog
    L6_1 = L6_1[1]
    L6_1 = L6_1.utf8p2
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = this_sigattrlog
      L7_1 = L7_1[1]
      L7_1 = L7_1.utf8p1
      L6_1 = L6_1(L7_1)
      L7_1 = L3_1
      L5_1 = L5_1(L6_1, L7_1)
      if L5_1 then
        L5_1 = this_sigattrlog
        L5_1 = L5_1[1]
        L2_1 = L5_1.utf8p2
    end
  end
end
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[2]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = isnull
    L6_1 = this_sigattrlog
    L6_1 = L6_1[2]
    L6_1 = L6_1.utf8p1
    L5_1 = L5_1(L6_1)
    if not L5_1 then
      L5_1 = isnull
      L6_1 = this_sigattrlog
      L6_1 = L6_1[2]
      L6_1 = L6_1.utf8p2
      L5_1 = L5_1(L6_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = this_sigattrlog
        L7_1 = L7_1[2]
        L7_1 = L7_1.utf8p1
        L6_1 = L6_1(L7_1)
        L7_1 = L3_1
        L5_1 = L5_1(L6_1, L7_1)
        if L5_1 then
          L5_1 = this_sigattrlog
          L5_1 = L5_1[2]
          L2_1 = L5_1.utf8p2
          L1_1 = 17
      end
    end
  end
  else
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = commandline_to_argv
L6_1 = L2_1
L5_1, L6_1 = L5_1(L6_1)
L7_1 = isnull
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L0_1 <= L5_1 and L1_1 >= L5_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L1_1 < L5_1 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L2_1
  L9_1 = "werfault%.exe\"? /hc? /shared Global([%c\\])%w+ /t %d+ /p %d+ %d+ %d+ %d+ %d+ %d+ %d+"
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L7_1 = string
    L7_1 = L7_1.find
    L8_1 = L4_1.command_line
    L9_1 = "svchost.exe\"? %-k WerSvcGroup$"
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 then
      goto lbl_139
    end
  end
end
L7_1 = string
L7_1 = L7_1.find
L8_1 = string
L8_1 = L8_1.lower
L9_1 = L4_1.command_line
L8_1 = L8_1(L9_1)
L9_1 = "\\microsoft\\azurewatson\\[0-9]\\awdump.+werfault%.exe\"? /hc? /shared global([%c\\])%w+ /t %d+ /p %d+ %d+ %d+ %d+ %d+ %d+ %d+"
L7_1 = L7_1(L8_1, L9_1)
::lbl_139::
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = {}
L7_1["/?"] = true
L7_1["-?"] = true
L7_1["-h"] = true
L7_1["/h"] = true
L7_1["--help"] = true
L7_1["/help"] = true
if L5_1 == 2 then
  L8_1 = isnull
  L9_1 = L6_1[2]
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    L8_1 = L6_1[2]
    L8_1 = L7_1[L8_1]
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
  end
end
L8_1 = versioning
L8_1 = L8_1.GetOrgID
L8_1 = L8_1()
L9_1 = isnull
L10_1 = L8_1
L9_1 = L9_1(L10_1)
if not L9_1 then
  L9_1 = string
  L9_1 = L9_1.lower
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 == "18a87cdb-84c8-4f1e-88c7-1ff1babb4e1a" then
    L9_1 = string
    L9_1 = L9_1.find
    L10_1 = L4_1.command_line
    L11_1 = "C:\\ProgramData\\Microsoft\\Windows Defender Advanced Threat Protection\\Downloads\\vaultsetup.exe"
    L12_1 = 1
    L13_1 = true
    L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    if L9_1 then
      L9_1 = mp
      L9_1 = L9_1.CLEAN
      return L9_1
    end
  end
end
L9_1 = bm
L9_1 = L9_1.get_process_relationships
L9_1, L10_1 = L9_1()
L11_1 = isnull
L12_1 = L10_1
L11_1 = L11_1(L12_1)
if not L11_1 then
  L11_1 = pairs
  L12_1 = L10_1
  L11_1, L12_1, L13_1 = L11_1(L12_1)
  for L14_1, L15_1 in L11_1, L12_1, L13_1 do
    L16_1 = isnull
    L17_1 = L15_1.ppid
    L16_1 = L16_1(L17_1)
    if not L16_1 then
      L16_1 = isnull
      L17_1 = L15_1.cmd_line
      L16_1 = L16_1(L17_1)
      if not L16_1 then
        L16_1 = L15_1.cmd_line
        if L16_1 == L2_1 then
          L16_1 = bm
          L16_1 = L16_1.add_related_process
          L17_1 = L15_1.ppid
          L16_1(L17_1)
          L16_1 = TrackPidAndTechniqueBM
          L17_1 = L15_1.ppid
          L18_1 = "T1055"
          L19_1 = "processinjection_target"
          L16_1(L17_1, L18_1, L19_1)
          L16_1 = TrackPidAndTechniqueBM
          L17_1 = L15_1.ppid
          L18_1 = "T1036"
          L19_1 = "masquerade_werfault"
          L16_1(L17_1, L18_1, L19_1)
          L16_1 = bm
          L16_1 = L16_1.trigger_sig
          L17_1 = "MasqueradeWerFaultProcess"
          L18_1 = string
          L18_1 = L18_1.format
          L19_1 = "Created by %s"
          L20_1 = L4_1.ppid
          L18_1 = L18_1(L19_1, L20_1)
          L19_1 = L15_1.ppid
          L16_1(L17_1, L18_1, L19_1)
        end
      end
    end
  end
end
L11_1 = bm
L11_1 = L11_1.trigger_sig
L12_1 = "MasqueradeWerFaultProcess"
L13_1 = "Created fake WerFault"
L11_1(L12_1, L13_1)
L11_1 = TrackPidAndTechniqueBM
L12_1 = L4_1.ppid
L13_1 = "T1055"
L14_1 = "processinjection"
L11_1(L12_1, L13_1, L14_1)
L11_1 = mp
L11_1 = L11_1.INFECTED
return L11_1
