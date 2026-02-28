local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1 = L1_1()
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = isnull
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    if not L2_1 then
      L2_1 = isnull
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L3_1 = L3_1.utf8p1
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L2_1 = isnull
        L3_1 = L0_1
        L2_1 = L2_1(L3_1)
        if not L2_1 then
          L2_1 = isnull
          L3_1 = L0_1.ppid
          L2_1 = L2_1(L3_1)
          if not L2_1 then
            L2_1 = isnull
            L3_1 = L1_1
            L2_1 = L2_1(L3_1)
            if not L2_1 then
              goto lbl_49
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_49::
L2_1 = L0_1.ppid
L3_1 = MpCommon
L3_1 = L3_1.PathToWin32Path
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
L0_1 = L2_1
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.match
L3_1 = this_sigattrlog
L3_1 = L3_1[1]
L3_1 = L3_1.utf8p1
L4_1 = "imagepath:(.*)"
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.match
L4_1 = this_sigattrlog
L4_1 = L4_1[2]
L4_1 = L4_1.utf8p1
L5_1 = "imagepath:(.*)"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = isnull
L5_1 = L2_1
L4_1 = L4_1(L5_1)
if not L4_1 then
  L4_1 = isnull
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    goto lbl_96
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_96::
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L6_1 = isnull
L7_1 = L4_1
L6_1 = L6_1(L7_1)
if not L6_1 then
  L6_1 = isnull
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if not L6_1 then
    goto lbl_117
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_117::
L6_1 = string
L6_1 = L6_1.lower
L7_1 = L4_1
L6_1 = L6_1(L7_1)
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L5_1
L7_1 = L7_1(L8_1)
L5_1 = L7_1
L4_1 = L6_1
if L4_1 == L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end

function L6_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  L3_2 = isnull
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = isnull
    L4_2 = A1_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      goto lbl_18
    end
    L3_2 = isnull
    L4_2 = A2_2
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      goto lbl_18
    end
  end
  L3_2 = nil
  do return L3_2 end
  ::lbl_18::
  L3_2 = isnull
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = {}
    A1_2 = L3_2
  end
  L3_2 = isnull
  L4_2 = A2_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = {}
    A2_2 = L3_2
  end
  L3_2 = {}
  L3_2.parent = nil
  L3_2.inject = nil
  L4_2 = pairs
  L5_2 = A0_2
  L4_2, L5_2, L6_2 = L4_2(L5_2)
  for L7_2, L8_2 in L4_2, L5_2, L6_2 do
    L9_2 = isnull
    L10_2 = L8_2.image_path
    L9_2 = L9_2(L10_2)
    if not L9_2 then
      L9_2 = isnull
      L10_2 = L8_2.ppid
      L9_2 = L9_2(L10_2)
      if not L9_2 then
        L9_2 = isnull
        L10_2 = L8_2.reason
        L9_2 = L9_2(L10_2)
        if not L9_2 then
          L9_2 = MpCommon
          L9_2 = L9_2.PathToWin32Path
          L10_2 = L8_2.image_path
          L9_2 = L9_2(L10_2)
          L10_2 = nil
          L11_2 = nil
          L12_2 = isnull
          L13_2 = L9_2
          L12_2 = L12_2(L13_2)
          if L12_2 then
            L9_2 = ""
          else
            L12_2 = string
            L12_2 = L12_2.match
            L13_2 = L9_2
            L14_2 = "..*[\\/](.+)"
            L12_2 = L12_2(L13_2, L14_2)
            L10_2 = L12_2
            L12_2 = string
            L12_2 = L12_2.lower
            L13_2 = L9_2
            L12_2 = L12_2(L13_2)
            L9_2 = L12_2
          end
          L12_2 = in_array
          L13_2 = A2_2
          L14_2 = L8_2.ppid
          L12_2 = L12_2(L13_2, L14_2)
          if not L12_2 then
            L12_2 = in_array
            L13_2 = A1_2
            L14_2 = L9_2
            L12_2 = L12_2(L13_2, L14_2)
            if not L12_2 then
              goto lbl_139
            end
          end
          L12_2 = L8_2.reason
          L13_2 = bm
          L13_2 = L13_2.RELATIONSHIP_CREATED
          if L12_2 == L13_2 then
            L12_2 = string
            L12_2 = L12_2.match
            L13_2 = L8_2.ppid
            L14_2 = "pid:([0-9]+),ProcessStart:([0-9]+)"
            L12_2, L13_2 = L12_2(L13_2, L14_2)
            L14_2 = isnull
            L15_2 = L12_2
            L14_2 = L14_2(L15_2)
            if not L14_2 then
              L14_2 = isnull
              L15_2 = L13_2
              L14_2 = L14_2(L15_2)
              if not L14_2 then
                L14_2 = isnull
                L15_2 = L10_2
                L14_2 = L14_2(L15_2)
                if not L14_2 then
                  L14_2 = string
                  L14_2 = L14_2.format
                  L15_2 = "imagename:%s;targetprocessppid:%d:%d"
                  L16_2 = L10_2
                  L17_2 = L12_2
                  L18_2 = L13_2
                  L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
                  L11_2 = L14_2
                end
              end
            end
            L14_2 = {}
            L14_2.name = L9_2
            L15_2 = L8_2.ppid
            L14_2.ppid = L15_2
            L14_2.trigger = L11_2
            L3_2.parent = L14_2
          else
            L12_2 = L8_2.reason
            L13_2 = bm
            L13_2 = L13_2.RELATIONSHIP_INJECTION
            if L12_2 == L13_2 then
              L12_2 = {}
              L12_2.name = L9_2
              L13_2 = L8_2.ppid
              L12_2.ppid = L13_2
              L3_2.inject = L12_2
            end
          end
        end
      end
    end
    ::lbl_139::
  end
  return L3_2
end

has_relationship = L6_1
L6_1 = nil
L7_1 = nil
L8_1 = nil
L9_1 = nil
L10_1 = nil
L11_1 = nil
L12_1 = has_relationship
L13_1 = bm
L13_1 = L13_1.get_process_relationships
L13_1 = L13_1()
L14_1 = {}
L15_1 = L4_1
L16_1 = L5_1
L14_1[1] = L15_1
L14_1[2] = L16_1
L12_1 = L12_1(L13_1, L14_1)
L13_1 = isnull
L14_1 = L12_1
L13_1 = L13_1(L14_1)
if not L13_1 then
  L13_1 = isnull
  L14_1 = L12_1.parent
  L13_1 = L13_1(L14_1)
  if not L13_1 then
    L13_1 = isnull
    L14_1 = L12_1.parent
    L14_1 = L14_1.name
    L13_1 = L13_1(L14_1)
    if not L13_1 then
      L13_1 = isnull
      L14_1 = L12_1.parent
      L14_1 = L14_1.ppid
      L13_1 = L13_1(L14_1)
      if not L13_1 then
        L13_1 = isnull
        L14_1 = L12_1.parent
        L14_1 = L14_1.trigger
        L13_1 = L13_1(L14_1)
        if not L13_1 then
          goto lbl_176
        end
      end
    end
  end
end
L13_1 = mp
L13_1 = L13_1.CLEAN
do return L13_1 end
goto lbl_189
::lbl_176::
L13_1 = L12_1.parent
L13_1 = L13_1.name
L14_1 = L12_1.parent
L7_1 = L14_1.ppid
L6_1 = L13_1
L13_1 = isnull
L14_1 = L12_1.parent
L14_1 = L14_1.trigger
L13_1 = L13_1(L14_1)
if not L13_1 then
  L13_1 = L12_1.parent
  L8_1 = L13_1.trigger
end
::lbl_189::
L13_1 = isnull
L14_1 = L12_1.inject
L13_1 = L13_1(L14_1)
if not L13_1 then
  L13_1 = isnull
  L14_1 = L12_1.inject
  L14_1 = L14_1.name
  L13_1 = L13_1(L14_1)
  if not L13_1 then
    L13_1 = isnull
    L14_1 = L12_1.inject
    L14_1 = L14_1.ppid
    L13_1 = L13_1(L14_1)
    if not L13_1 then
      L13_1 = L12_1.inject
      L13_1 = L13_1.name
      L14_1 = L12_1.inject
      L10_1 = L14_1.ppid
      L9_1 = L13_1
  end
end
elseif L6_1 == L4_1 then
  L9_1 = L5_1
elseif L6_1 == L5_1 then
  L9_1 = L4_1
else
  L13_1 = mp
  L13_1 = L13_1.CLEAN
  return L13_1
end
L13_1 = string
L13_1 = L13_1.match
L14_1 = L1_1
L15_1 = "..*[\\/](.+)"
L13_1 = L13_1(L14_1, L15_1)
L14_1 = string
L14_1 = L14_1.match
L15_1 = L9_1
L16_1 = "..*[\\/](.+)"
L14_1 = L14_1(L15_1, L16_1)
L15_1 = string
L15_1 = L15_1.match
L16_1 = L6_1
L17_1 = "..*[\\/](.+)"
L15_1 = L15_1(L16_1, L17_1)
L16_1 = isnull
L17_1 = L14_1
L16_1 = L16_1(L17_1)
if not L16_1 then
  L16_1 = isnull
  L17_1 = L15_1
  L16_1 = L16_1(L17_1)
  if not L16_1 then
    L16_1 = isnull
    L17_1 = L13_1
    L16_1 = L16_1(L17_1)
    if not L16_1 then
      if L14_1 == "csrss.exe" then
        L16_1 = in_array
        L17_1 = {}
        L18_1 = "senseir.exe"
        L19_1 = "sensecm.exe"
        L20_1 = "agentexecutor.exe"
        L17_1[1] = L18_1
        L17_1[2] = L19_1
        L17_1[3] = L20_1
        L18_1 = L15_1
        L16_1 = L16_1(L17_1, L18_1)
        if L16_1 and L13_1 == "powershell.exe" then
          goto lbl_328
        end
      end
      if L14_1 == "svchost.exe" and L15_1 == "explorer.exe" then
        L16_1 = in_array
        L17_1 = {}
        L18_1 = "chrome.exe"
        L19_1 = "excel.exe"
        L20_1 = "msedge.exe"
        L21_1 = "winword.exe"
        L22_1 = "outlook.exe"
        L23_1 = "powerpnt.exe"
        L17_1[1] = L18_1
        L17_1[2] = L19_1
        L17_1[3] = L20_1
        L17_1[4] = L21_1
        L17_1[5] = L22_1
        L17_1[6] = L23_1
        L18_1 = L13_1
        L16_1 = L16_1(L17_1, L18_1)
        if L16_1 then
          goto lbl_328
        end
      end
      if L14_1 == "officeclicktorun.exe" then
        L16_1 = in_array
        L17_1 = {}
        L18_1 = "excel.exe"
        L19_1 = "winword.exe"
        L20_1 = "outlook.exe"
        L21_1 = "powerpnt.exe"
        L17_1[1] = L18_1
        L17_1[2] = L19_1
        L17_1[3] = L20_1
        L17_1[4] = L21_1
        L18_1 = L13_1
        L16_1 = L16_1(L17_1, L18_1)
      end
      if not L16_1 and (L14_1 ~= "csrss.exe" or L15_1 ~= "powershell.exe" or L13_1 ~= "csc.exe") and (L14_1 ~= "csrss.exe" or L15_1 ~= "azqualysscancommand.exe" or L13_1 ~= "cmd.exe") and (L14_1 ~= "microsoft.management.services.intunewindowsagent.exe" or L15_1 ~= "agentexecutor.exe" or L13_1 ~= "conhost.exe") then
        if L14_1 ~= "powershell.exe" then
          goto lbl_331
        end
        L16_1 = in_array
        L17_1 = {}
        L18_1 = "cmd.exe"
        L19_1 = "mpcmdrun.exe"
        L17_1[1] = L18_1
        L17_1[2] = L19_1
        L18_1 = L15_1
        L16_1 = L16_1(L17_1, L18_1)
        if not L16_1 or L13_1 ~= "conhost.exe" then
          goto lbl_331
        end
      end
    end
  end
end
::lbl_328::
L16_1 = mp
L16_1 = L16_1.CLEAN
do return L16_1 end
::lbl_331::
L16_1 = nil
L17_1 = isnull
L18_1 = L10_1
L17_1 = L17_1(L18_1)
if L17_1 then
  L17_1 = has_relationship
  L18_1 = bm
  L18_1 = L18_1.get_process_relationships
  L19_1 = L7_1
  L18_1 = L18_1(L19_1)
  L19_1 = {}
  L20_1 = L9_1
  L19_1[1] = L20_1
  L17_1 = L17_1(L18_1, L19_1)
  L16_1 = L17_1
else
  L17_1 = has_relationship
  L18_1 = bm
  L18_1 = L18_1.get_process_relationships
  L19_1 = L7_1
  L18_1 = L18_1(L19_1)
  L19_1 = {}
  L20_1 = {}
  L21_1 = L10_1
  L20_1[1] = L21_1
  L17_1 = L17_1(L18_1, L19_1, L20_1)
  L16_1 = L17_1
end
L17_1 = isnull
L18_1 = L16_1
L17_1 = L17_1(L18_1)
if not L17_1 then
  L17_1 = isnull
  L18_1 = L16_1.parent
  L17_1 = L17_1(L18_1)
  if not L17_1 then
    L17_1 = isnull
    L18_1 = L16_1.parent
    L18_1 = L18_1.ppid
    L17_1 = L17_1(L18_1)
    if not L17_1 then
      L17_1 = "created"
      L18_1 = L16_1.parent
      L10_1 = L18_1.ppid
      L11_1 = L17_1
  end
end
else
  L17_1 = isnull
  L18_1 = L16_1
  L17_1 = L17_1(L18_1)
  if not L17_1 then
    L17_1 = isnull
    L18_1 = L16_1.inject
    L17_1 = L17_1(L18_1)
    if not L17_1 then
      L17_1 = isnull
      L18_1 = L16_1.inject
      L18_1 = L18_1.ppid
      L17_1 = L17_1(L18_1)
      if not L17_1 then
        L17_1 = "injected"
        L18_1 = L16_1.inject
        L10_1 = L18_1.ppid
        L11_1 = L17_1
      end
    end
  end
end
if L11_1 == "created" then
  L17_1 = in_array
  L18_1 = {}
  L19_1 = "cmd.exe"
  L20_1 = "powershell.exe"
  L18_1[1] = L19_1
  L18_1[2] = L20_1
  L19_1 = L15_1
  L17_1 = L17_1(L18_1, L19_1)
  if L17_1 then
    L17_1 = mp
    L17_1 = L17_1.CLEAN
    return L17_1
  end
end
L17_1 = isnull
L18_1 = L10_1
L17_1 = L17_1(L18_1)
if not L17_1 then
  L17_1 = bm
  L17_1 = L17_1.trigger_sig_target_propagate
  L18_1 = string
  L18_1 = L18_1.format
  L19_1 = "ProcessReparent %s from %s to %s as new parent of: %s"
  L20_1 = L11_1
  L21_1 = L10_1
  L22_1 = L7_1
  L23_1 = L0_1
  L18_1 = L18_1(L19_1, L20_1, L21_1, L22_1, L23_1)
  L19_1 = L8_1
  L20_1 = L10_1
  L17_1(L18_1, L19_1, L20_1)
end
L17_1 = mp
L17_1 = L17_1.CLEAN
return L17_1
