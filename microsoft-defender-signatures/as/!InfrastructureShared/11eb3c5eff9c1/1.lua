local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L3_1 = this_sigattrlog
L3_1 = L3_1[8]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[8]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[8]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[8]
      L3_1 = L3_1.utf8p1
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[8]
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
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L0_1 = L3_1
L3_1 = IsExcludedByImagePathMacOS
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L3_1.command_line
L5_1 = IsExcludedByCmdlineMacOS
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = this_sigattrlog
L5_1 = L5_1[8]
L1_1 = L5_1.utf8p2
L5_1 = this_sigattrlog
L5_1 = L5_1[8]
L2_1 = L5_1.utf8p1
L5_1 = mp
L5_1 = L5_1.SIGATTR_LOG_SZ
L6_1 = L5_1 - 1
L7_1 = 1
L8_1 = -1
for L9_1 = L6_1, L7_1, L8_1 do
  L10_1 = sigattr_tail
  L10_1 = L10_1[L9_1]
  if L10_1 ~= nil then
    L10_1 = sigattr_tail
    L10_1 = L10_1[L9_1]
    L10_1 = L10_1.attribute
    if L10_1 ~= nil then
      L10_1 = sigattr_tail
      L10_1 = L10_1[L9_1]
      L10_1 = L10_1.attribute
      if L10_1 == 16384 then
        L10_1 = sigattr_tail
        L10_1 = L10_1[L9_1]
        L10_1 = L10_1.utf8p1
        if L10_1 ~= nil then
          L10_1 = sigattr_tail
          L10_1 = L10_1[L9_1]
          L10_1 = L10_1.utf8p1
          if L10_1 ~= "" then
            L10_1 = string
            L10_1 = L10_1.find
            L11_1 = sigattr_tail
            L11_1 = L11_1[L9_1]
            L11_1 = L11_1.utf8p1
            L12_1 = "%$HOME%$/"
            L10_1 = L10_1(L11_1, L12_1)
            if L10_1 ~= 1 then
              L10_1 = sigattr_tail
              L10_1 = L10_1[L9_1]
              L10_1 = L10_1.utf8p1
              if L10_1 ~= L2_1 then
                L10_1 = string
                L10_1 = L10_1.find
                L11_1 = L1_1
                L12_1 = sigattr_tail
                L12_1 = L12_1[L9_1]
                L12_1 = L12_1.utf8p1
                L13_1 = L12_1
                L12_1 = L12_1.match
                L14_1 = "[^/]*$"
                L12_1 = L12_1(L13_1, L14_1)
                L13_1 = 1
                L14_1 = true
                L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
                if not L10_1 then
                  goto lbl_151
                end
              end
              L10_1 = SuspMacPathsToMonitor
              L11_1 = sigattr_tail
              L11_1 = L11_1[L9_1]
              L11_1 = L11_1.utf8p1
              L12_1 = true
              L10_1 = L10_1(L11_1, L12_1)
              if L10_1 then
                L10_1 = sysio
                L10_1 = L10_1.IsFileExists
                L11_1 = sigattr_tail
                L11_1 = L11_1[L9_1]
                L11_1 = L11_1.utf8p1
                L10_1 = L10_1(L11_1)
                if L10_1 then
                  L10_1 = bm
                  L10_1 = L10_1.trigger_sig
                  L11_1 = "BM_SusFileDownExec"
                  L12_1 = sigattr_tail
                  L12_1 = L12_1[L9_1]
                  L12_1 = L12_1.utf8p1
                  L10_1(L11_1, L12_1)
                end
                L10_1 = mp
                L10_1 = L10_1.INFECTED
                return L10_1
              end
              L10_1 = mp
              L10_1 = L10_1.CLEAN
              return L10_1
            end
          end
        end
      end
    end
  end
  ::lbl_151::
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
