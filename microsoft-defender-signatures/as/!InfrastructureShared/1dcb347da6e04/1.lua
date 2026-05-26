-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1dcb347da6e04\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.command_line) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2, l_0_3 = nil, nil
if (this_sigattrlog[2]).matched then
  l_0_2 = "invoke-command"
else
  -- DECOMPILER ERROR at PC44: Overwrote pending register: R3 in 'AssignReg'

  if (this_sigattrlog[3]).matched then
    l_0_2 = "new-pssession"
  else
    -- DECOMPILER ERROR at PC53: Overwrote pending register: R3 in 'AssignReg'

    if (this_sigattrlog[4]).matched then
      l_0_2 = "enter-pssession"
    else
      -- DECOMPILER ERROR at PC62: Overwrote pending register: R3 in 'AssignReg'

      if (this_sigattrlog[5]).matched then
        l_0_2 = "invoke-command"
      else
        -- DECOMPILER ERROR at PC71: Overwrote pending register: R3 in 'AssignReg'

        if (this_sigattrlog[6]).matched then
          l_0_2 = "new-pssession"
        else
          -- DECOMPILER ERROR at PC80: Overwrote pending register: R3 in 'AssignReg'

          if (this_sigattrlog[7]).matched then
            l_0_2 = "enter-pssession"
          else
            return mp.CLEAN
          end
        end
      end
    end
  end
end
if not (string.find)(l_0_1, "-computername", 1, true) and not (string.find)(l_0_1, "-cn ", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "-computername localhost", 1, true) or (string.find)(l_0_1, "-computername .", 1, true) or (string.find)(l_0_1, "-computername 127.0.0.1", 1, true) or (string.find)(l_0_1, "-computername $env:computername", 1, true) then
  return mp.CLEAN
end
local l_0_4 = {}
-- DECOMPILER ERROR at PC159: No list found for R4 , SetList fails

-- DECOMPILER ERROR at PC160: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC161: Overwrote pending register: R6 in 'AssignReg'

for l_0_8,l_0_9 in ("\\desiredstateconfiguration\\")("\\dsc\\") do
  -- DECOMPILER ERROR at PC164: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC166: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC167: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC168: Overwrote pending register: R13 in 'AssignReg'

  if (("\\azuremonitoragent\\").find)("\\ccmexec\\", "\\ccm\\scriptstore\\", "\\intunemanagementextension\\", true) then
    return mp.CLEAN
  end
end
do
  local l_0_10 = ""
  -- DECOMPILER ERROR at PC199: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC210: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC248: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC268: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC288: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC296: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC296: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC296: Unhandled construct in 'MakeBoolean' P3

  if ((((((string.find)(l_0_1, "-credential", 1, true) and not (string.find)(l_0_1, "-authentication credssp", 1, true)) or (string.find)(l_0_1, "-authentication basic", 1, true)) and not (string.find)(l_0_1, "-usessl", 1, true)) or (string.find)(l_0_1, "-skipcacheck", 1, true) or (string.find)(l_0_1, "-skipcncheck", 1, true) or (string.find)(l_0_1, "convertto-securestring", 1, true)) and not (string.find)(l_0_1, "frombase64string", 1, true)) or isnull(l_0_10) then
    return mp.CLEAN
  end
  ;
  (bm.add_related_string)("WinRMLM_reason", l_0_10, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMLM_cmdlet", l_0_2, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMLM_host", l_0_3, bm.RelatedStringBMReport)
  ;
  (bm.add_related_string)("WinRMLM_cmd", l_0_1, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1021.006", "SuspWinRMLateralMove")
  add_parents()
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

