local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.command_line
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_33
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_33::
L3_1 = is_valid_ip
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "/bin/bash"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L2_1
    L5_1 = "/bin/zsh"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L2_1
      L5_1 = "/bin/sh"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.match
        L5_1 = "'(bash)'"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.match
          L5_1 = "\"(bash)\""
          L3_1 = L3_1(L4_1, L5_1)
          if not L3_1 then
            L4_1 = L2_1
            L3_1 = L2_1.match
            L5_1 = "'(sh)'"
            L3_1 = L3_1(L4_1, L5_1)
            if not L3_1 then
              L4_1 = L2_1
              L3_1 = L2_1.match
              L5_1 = "\"(sh)\""
              L3_1 = L3_1(L4_1, L5_1)
              if not L3_1 then
                L4_1 = L2_1
                L3_1 = L2_1.match
                L5_1 = "'(zsh)'"
                L3_1 = L3_1(L4_1, L5_1)
                if not L3_1 then
                  L4_1 = L2_1
                  L3_1 = L2_1.match
                  L5_1 = "\"(zsh)\""
                  L3_1 = L3_1(L4_1, L5_1)
                  if not L3_1 then
                    L4_1 = L2_1
                    L3_1 = L2_1.find
                    L5_1 = "zsh -i"
                    L6_1 = 1
                    L7_1 = true
                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                    if not L3_1 then
                      L4_1 = L2_1
                      L3_1 = L2_1.find
                      L5_1 = "bash -i"
                      L6_1 = 1
                      L7_1 = true
                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                      if not L3_1 then
                        L4_1 = L2_1
                        L3_1 = L2_1.find
                        L5_1 = "sh -i"
                        L6_1 = 1
                        L7_1 = true
                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                        if not L3_1 then
                          goto lbl_130
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
  L3_1 = bm
  L3_1 = L3_1.trigger_sig
  L4_1 = "GenericReverseShell"
  L5_1 = L0_1
  L6_1 = L1_1.ppid
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.trigger_sig
  L4_1 = "BmTraverseTreeBlockMac"
  L5_1 = "Detected"
  L3_1(L4_1, L5_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_130::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
