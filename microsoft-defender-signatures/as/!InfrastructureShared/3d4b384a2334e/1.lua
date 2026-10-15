-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3d4b384a2334e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true
l_0_1["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true
l_0_1["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true
l_0_1["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
if not l_0_1[(string.lower)(l_0_0)] then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4 = nil, nil, nil
if (this_sigattrlog[11]).matched and not isnull((this_sigattrlog[11]).utf8p1) and not isnull((this_sigattrlog[11]).utf8p2) then
  l_0_2 = "ChildCmd"
  l_0_3 = (this_sigattrlog[11]).utf8p1
  l_0_4 = (this_sigattrlog[11]).utf8p2
else
  if (this_sigattrlog[12]).matched and not isnull((this_sigattrlog[12]).utf8p1) and not isnull((this_sigattrlog[12]).utf8p2) then
    l_0_2 = "ChildPowershell"
    l_0_3 = (this_sigattrlog[12]).utf8p1
    l_0_4 = (this_sigattrlog[12]).utf8p2
  else
    if (this_sigattrlog[13]).matched and not isnull((this_sigattrlog[13]).utf8p1) and not isnull((this_sigattrlog[13]).utf8p2) then
      l_0_2 = "ChildPwsh"
      l_0_3 = (this_sigattrlog[13]).utf8p1
      l_0_4 = (this_sigattrlog[13]).utf8p2
    else
      if (this_sigattrlog[14]).matched and not isnull((this_sigattrlog[14]).utf8p1) and not isnull((this_sigattrlog[14]).utf8p2) then
        l_0_2 = "ChildCscript"
        l_0_3 = (this_sigattrlog[14]).utf8p1
        l_0_4 = (this_sigattrlog[14]).utf8p2
      else
        if (this_sigattrlog[15]).matched and not isnull((this_sigattrlog[15]).utf8p1) and not isnull((this_sigattrlog[15]).utf8p2) then
          l_0_2 = "ChildWscript"
          l_0_3 = (this_sigattrlog[15]).utf8p1
          l_0_4 = (this_sigattrlog[15]).utf8p2
        else
          if (this_sigattrlog[16]).matched and not isnull((this_sigattrlog[16]).utf8p1) and not isnull((this_sigattrlog[16]).utf8p2) then
            l_0_2 = "ChildMshta"
            l_0_3 = (this_sigattrlog[16]).utf8p1
            l_0_4 = (this_sigattrlog[16]).utf8p2
          else
            if (this_sigattrlog[17]).matched and not isnull((this_sigattrlog[17]).utf8p1) and not isnull((this_sigattrlog[17]).utf8p2) then
              l_0_2 = "ChildBitsadmin"
              l_0_3 = (this_sigattrlog[17]).utf8p1
              l_0_4 = (this_sigattrlog[17]).utf8p2
            else
              if (this_sigattrlog[18]).matched and not isnull((this_sigattrlog[18]).utf8p1) and not isnull((this_sigattrlog[18]).utf8p2) then
                l_0_2 = "ChildRegsvr32"
                l_0_3 = (this_sigattrlog[18]).utf8p1
                l_0_4 = (this_sigattrlog[18]).utf8p2
              else
                if (this_sigattrlog[19]).matched and not isnull((this_sigattrlog[19]).utf8p1) and not isnull((this_sigattrlog[19]).utf8p2) then
                  l_0_2 = "ChildRundll32"
                  l_0_3 = (this_sigattrlog[19]).utf8p1
                  l_0_4 = (this_sigattrlog[19]).utf8p2
                end
              end
            end
          end
        end
      end
    end
  end
end
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
l_0_4 = (string.lower)(l_0_4)
local l_0_5 = l_0_4
l_0_4 = (string.gsub)(l_0_4, "[\"%s]+", " ")
local l_0_6 = {}
-- DECOMPILER ERROR at PC319: No list found for R6 , SetList fails

local l_0_7 = {}
-- DECOMPILER ERROR at PC321: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC322: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC323: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC324: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC325: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC326: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC327: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC328: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC329: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC330: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC331: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC332: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC333: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC334: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC335: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC336: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC337: Overwrote pending register: R24 in 'AssignReg'

-- DECOMPILER ERROR at PC338: Overwrote pending register: R25 in 'AssignReg'

-- DECOMPILER ERROR at PC339: Overwrote pending register: R26 in 'AssignReg'

-- DECOMPILER ERROR at PC340: Overwrote pending register: R27 in 'AssignReg'

-- DECOMPILER ERROR at PC341: Overwrote pending register: R28 in 'AssignReg'

-- DECOMPILER ERROR at PC342: Overwrote pending register: R29 in 'AssignReg'

-- DECOMPILER ERROR at PC371: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC372: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC373: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC374: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC375: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC376: No list found for R7 , SetList fails

local l_0_8 = {}
-- DECOMPILER ERROR at PC378: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC379: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC380: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC381: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC382: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC383: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC384: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC385: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC386: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC387: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC388: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC389: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC390: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC391: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC392: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC393: Overwrote pending register: R24 in 'AssignReg'

-- DECOMPILER ERROR at PC394: Overwrote pending register: R25 in 'AssignReg'

-- DECOMPILER ERROR at PC395: Overwrote pending register: R26 in 'AssignReg'

-- DECOMPILER ERROR at PC396: Overwrote pending register: R27 in 'AssignReg'

-- DECOMPILER ERROR at PC397: Overwrote pending register: R28 in 'AssignReg'

-- DECOMPILER ERROR at PC398: Overwrote pending register: R29 in 'AssignReg'

-- DECOMPILER ERROR at PC399: Overwrote pending register: R30 in 'AssignReg'

-- DECOMPILER ERROR at PC400: Overwrote pending register: R31 in 'AssignReg'

-- DECOMPILER ERROR at PC401: Overwrote pending register: R32 in 'AssignReg'

-- DECOMPILER ERROR at PC402: Overwrote pending register: R33 in 'AssignReg'

-- DECOMPILER ERROR at PC403: Overwrote pending register: R34 in 'AssignReg'

-- DECOMPILER ERROR at PC404: Overwrote pending register: R35 in 'AssignReg'

-- DECOMPILER ERROR at PC405: Overwrote pending register: R36 in 'AssignReg'

-- DECOMPILER ERROR at PC406: Overwrote pending register: R37 in 'AssignReg'

-- DECOMPILER ERROR at PC407: Overwrote pending register: R38 in 'AssignReg'

-- DECOMPILER ERROR at PC408: Overwrote pending register: R39 in 'AssignReg'

-- DECOMPILER ERROR at PC409: Overwrote pending register: R40 in 'AssignReg'

-- DECOMPILER ERROR at PC410: Overwrote pending register: R41 in 'AssignReg'

-- DECOMPILER ERROR at PC411: Overwrote pending register: R42 in 'AssignReg'

-- DECOMPILER ERROR at PC412: Overwrote pending register: R43 in 'AssignReg'

-- DECOMPILER ERROR at PC413: Overwrote pending register: R44 in 'AssignReg'

-- DECOMPILER ERROR at PC414: Overwrote pending register: R45 in 'AssignReg'

-- DECOMPILER ERROR at PC415: No list found for R8 , SetList fails

-- DECOMPILER ERROR at PC416: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC417: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC418: Overwrote pending register: R11 in 'AssignReg'

do
  if not (" -enc ")("-enc ", "iex(", true) and not contains(l_0_4, l_0_7, true) then
    local l_0_9 = contains(l_0_4, l_0_8, true)
  end
  -- DECOMPILER ERROR at PC435: Confused about usage of register: R9 in 'UnsetPending'

  if not l_0_9 then
    return mp.CLEAN
  end
  local l_0_10 = nil
  -- DECOMPILER ERROR at PC448: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC456: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC457: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC458: Overwrote pending register: R15 in 'AssignReg'

  if not (this_sigattrlog[10]).matched or not isnull(nil) then
    TrackPidAndTechniqueBM("BM", " iex ", "invoke-expression", "downloadstring")
    -- DECOMPILER ERROR at PC462: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (bm.add_related_process)(nil)
  end
  local l_0_11 = nil
  if not isnull((mp.GetExecutablesFromCommandLine)(l_0_5)) then
    local l_0_12 = nil
    do
      if #(mp.GetExecutablesFromCommandLine)(l_0_5) >= 1 then
        local l_0_13 = nil
        if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_12[1])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(l_0_12[1])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(l_0_12[1]), true, false) then
          (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(l_0_12[1]))
        end
      end
      -- DECOMPILER ERROR at PC503: Confused about usage of register: R12 in 'UnsetPending'

      do
        if l_0_13 >= 2 then
          local l_0_14 = nil
          if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_12[2])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(l_0_12[2])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(l_0_12[2]), true, false) then
            (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(l_0_12[2]))
          end
        end
        -- DECOMPILER ERROR at PC532: Confused about usage of register: R12 in 'UnsetPending'

        do
          do
            if l_0_14 >= 3 then
              local l_0_15 = nil
              if not isnull((mp.ContextualExpandEnvironmentVariables)(l_0_12[3])) and (sysio.IsFileExists)((mp.ContextualExpandEnvironmentVariables)(l_0_12[3])) and not (mp.IsKnownFriendlyFile)((mp.ContextualExpandEnvironmentVariables)(l_0_12[3]), true, false) then
                (bm.add_related_file)((mp.ContextualExpandEnvironmentVariables)(l_0_12[3]))
              end
            end
            ;
            (bm.add_related_string)("iis_shell_child_path", l_0_3, bm.RelatedStringBMReport)
            ;
            (bm.add_related_string)("iis_shell_child_name", l_0_2, bm.RelatedStringBMReport)
            ;
            (bm.add_related_string)("iis_shell_cmd_len", tostring(#l_0_5), bm.RelatedStringBMReport)
            add_parents()
            do return mp.INFECTED end
            -- WARNING: undefined locals caused missing assignments!
          end
        end
      end
    end
  end
end

