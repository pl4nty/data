local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L3_1 = this_sigattrlog
L3_1 = L3_1[9]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[9]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[9]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[9]
      L3_1 = L3_1.utf8p1
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[9]
        L3_1 = L3_1.utf8p1
        if L3_1 ~= "" then
          goto lbl_29
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_29::
L3_1 = {}
L4_1 = "/tmp/test10"
L5_1 = "/private/tmp/test10"
L6_1 = "/tmp/test9.scpt"
L7_1 = "/private/tmp/test9.scpt"
L8_1 = "/usr/local/bin/com.docker.sock"
L9_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomHelperTool"
L10_1 = "/usr/local/bin/com.docker.vmnat"
L11_1 = "/usr/local/bin/com.docker.vmnat.lock"
L12_1 = "/Library/PrivilegedHelperTools/com.microsoft.teams.TeamsDaemon"
L13_1 = "/Library/PrivilegedHelperTools/us.zoom.ZoomService"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1 = L4_1()
L0_1 = L4_1
if L0_1 == nil or L0_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsExcludedByImagePathMacOS
L5_1 = L0_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = bm
L4_1 = L4_1.get_current_process_startup_info
L4_1 = L4_1()
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = L4_1.command_line
L6_1 = IsExcludedByCmdlineMacOS
L7_1 = L5_1
L6_1 = L6_1(L7_1)
if L6_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = this_sigattrlog
L6_1 = L6_1[9]
L1_1 = L6_1.utf8p2
L6_1 = this_sigattrlog
L6_1 = L6_1[9]
L2_1 = L6_1.utf8p1
L6_1 = mp
L6_1 = L6_1.SIGATTR_LOG_SZ
L7_1 = L6_1 - 1
L8_1 = 1
L9_1 = -1
for L10_1 = L7_1, L8_1, L9_1 do
  L11_1 = sigattr_tail
  L11_1 = L11_1[L10_1]
  if L11_1 ~= nil then
    L11_1 = sigattr_tail
    L11_1 = L11_1[L10_1]
    L11_1 = L11_1.attribute
    if L11_1 ~= nil then
      L11_1 = sigattr_tail
      L11_1 = L11_1[L10_1]
      L11_1 = L11_1.attribute
      if L11_1 == 16384 then
        L11_1 = sigattr_tail
        L11_1 = L11_1[L10_1]
        L11_1 = L11_1.utf8p1
        if L11_1 ~= nil then
          L11_1 = sigattr_tail
          L11_1 = L11_1[L10_1]
          L11_1 = L11_1.utf8p1
          if L11_1 ~= "" then
            L11_1 = string
            L11_1 = L11_1.find
            L12_1 = sigattr_tail
            L12_1 = L12_1[L10_1]
            L12_1 = L12_1.utf8p1
            L13_1 = "%$HOME%$/"
            L11_1 = L11_1(L12_1, L13_1)
            if L11_1 ~= 1 then
              L11_1 = sigattr_tail
              L11_1 = L11_1[L10_1]
              L11_1 = L11_1.utf8p1
              if L11_1 ~= L2_1 then
                L11_1 = string
                L11_1 = L11_1.find
                L12_1 = L1_1
                L13_1 = sigattr_tail
                L13_1 = L13_1[L10_1]
                L13_1 = L13_1.utf8p1
                L14_1 = L13_1
                L13_1 = L13_1.match
                L15_1 = "[^/]*$"
                L13_1 = L13_1(L14_1, L15_1)
                L14_1 = 1
                L15_1 = true
                L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
                if not L11_1 then
                  goto lbl_185
                end
              end
              L11_1 = ipairs
              L12_1 = L3_1
              L11_1, L12_1, L13_1 = L11_1(L12_1)
              for L14_1, L15_1 in L11_1, L12_1, L13_1 do
                L16_1 = string
                L16_1 = L16_1.find
                L17_1 = sigattr_tail
                L17_1 = L17_1[L10_1]
                L17_1 = L17_1.utf8p1
                L18_1 = L15_1
                L19_1 = 1
                L20_1 = true
                L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
                if L16_1 == 1 then
                  L16_1 = sysio
                  L16_1 = L16_1.IsFileExists
                  L17_1 = sigattr_tail
                  L17_1 = L17_1[L10_1]
                  L17_1 = L17_1.utf8p1
                  L16_1 = L16_1(L17_1)
                  if L16_1 then
                    L16_1 = bm
                    L16_1 = L16_1.trigger_sig
                    L17_1 = "BM_SusFileDownExecM"
                    L18_1 = sigattr_tail
                    L18_1 = L18_1[L10_1]
                    L18_1 = L18_1.utf8p1
                    L16_1(L17_1, L18_1)
                    L16_1 = bm
                    L16_1 = L16_1.add_threat_file
                    L17_1 = sigattr_tail
                    L17_1 = L17_1[L10_1]
                    L17_1 = L17_1.utf8p1
                    L16_1(L17_1)
                  end
                  L16_1 = mp
                  L16_1 = L16_1.INFECTED
                  return L16_1
                end
              end
              L11_1 = mp
              L11_1 = L11_1.CLEAN
              return L11_1
            end
          end
        end
      end
    end
  end
  ::lbl_185::
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
