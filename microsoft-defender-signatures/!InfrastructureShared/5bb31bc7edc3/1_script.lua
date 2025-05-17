-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb31bc7edc3\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = (bm.get_imagepath)()
if not (this_sigattrlog[1]).matched or not (this_sigattrlog[2]).matched or isnull((this_sigattrlog[1]).utf8p1) or isnull((this_sigattrlog[2]).utf8p1) or isnull(l_0_0) or isnull(l_0_0.ppid) or isnull(l_0_1) then
  return mp.CLEAN
end
l_0_0 = l_0_0.ppid
if isnull(l_0_1) then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC67: Overwrote pending register: R1 in 'AssignReg'

local l_0_2 = (string.match)((this_sigattrlog[1]).utf8p1, "imagepath:(.*)")
local l_0_3 = (string.match)((this_sigattrlog[2]).utf8p1, "imagepath:(.*)")
if isnull(l_0_2) or isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = (MpCommon.PathToWin32Path)(l_0_2)
local l_0_5 = (MpCommon.PathToWin32Path)(l_0_3)
if isnull(l_0_4) or isnull(l_0_5) then
  return mp.CLEAN
end
l_0_4 = (string.lower)(l_0_4)
if l_0_4 == l_0_5 then
  return mp.CLEAN
end
has_relationship = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  if isnull(l_1_0) or isnull(l_1_1) and isnull(l_1_2) then
    return nil
  end
  if isnull(l_1_1) then
    l_1_1 = {}
  end
  if isnull(l_1_2) then
    l_1_2 = {}
  end
  local l_1_3 = {}
  l_1_3.parent = nil
  l_1_3.inject = nil
  for l_1_7,l_1_8 in pairs(l_1_0) do
    if not isnull(l_1_8.image_path) and not isnull(l_1_8.ppid) and not isnull(l_1_8.reason) then
      local l_1_9 = ((MpCommon.PathToWin32Path)(l_1_8.image_path))
      local l_1_10, l_1_11 = nil, nil
      if isnull(l_1_9) then
        l_1_9 = ""
      else
        l_1_10 = (string.match)(l_1_9, "..*[\\/](.+)")
        l_1_9 = (string.lower)(l_1_9)
      end
      if in_array(l_1_2, l_1_8.ppid) or in_array(l_1_1, l_1_9) then
        if l_1_8.reason == bm.RELATIONSHIP_CREATED then
          local l_1_12, l_1_13 = (string.match)(l_1_8.ppid, "pid:([0-9]+),ProcessStart:([0-9]+)")
          if not isnull(l_1_12) and not isnull(l_1_13) and not isnull(l_1_10) then
            l_1_11 = (string.format)("imagename:%s;targetprocessppid:%d:%d", l_1_10, l_1_12, l_1_13)
          end
          local l_1_14 = {}
          l_1_14.name = l_1_9
          l_1_14.ppid = l_1_8.ppid
          l_1_14.trigger = l_1_11
          l_1_3.parent = l_1_14
        else
          do
            do
              if l_1_8.reason == bm.RELATIONSHIP_INJECTION then
                local l_1_15 = {}
                l_1_15.name = l_1_9
                l_1_15.ppid = l_1_8.ppid
                l_1_3.inject = l_1_15
              end
              -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC138: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  return l_1_3
end

local l_0_6, l_0_7, l_0_8, l_0_9, l_0_10, l_0_11 = nil, nil, nil, nil, nil, nil
local l_0_12 = has_relationship
local l_0_13 = (bm.get_process_relationships)()
local l_0_14 = {}
-- DECOMPILER ERROR at PC141: No list found for R14 , SetList fails

-- DECOMPILER ERROR at PC148: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC149: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC153: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC154: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC155: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC159: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC160: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC161: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC165: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC166: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC167: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC171: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC172: Overwrote pending register: R13 in 'AssignReg'

if l_0_13 or l_0_13 or l_0_13 or l_0_13 or l_0_13 then
  return l_0_13
else
  -- DECOMPILER ERROR at PC175: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC177: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC181: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC182: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC186: Overwrote pending register: R13 in 'AssignReg'

end
-- DECOMPILER ERROR at PC188: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC189: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC193: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC194: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC195: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC199: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC200: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC201: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC205: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC206: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC207: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC213: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC217: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC219: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC220: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC221: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC221: Unhandled construct in 'MakeBoolean' P3

if ((l_0_13 or not l_0_13) and l_0_6 ~= l_0_4) or l_0_6 == l_0_5 then
  do return l_0_13 end
  -- DECOMPILER ERROR at PC222: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC223: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC224: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC225: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC227: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC228: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC230: Overwrote pending register: R16 in 'AssignReg'

  l_0_14 = l_0_14(l_0_9, l_0_5)
  local l_0_15 = (string.match)(l_0_6, "..*[\\/](.+)")
  if not isnull(l_0_14) and not isnull(l_0_15) and not isnull(l_0_13) then
    if l_0_14 == "csrss.exe" then
      local l_0_16 = in_array
      local l_0_17 = {}
      -- DECOMPILER ERROR at PC259: No list found for R17 , SetList fails

      -- DECOMPILER ERROR at PC260: Overwrote pending register: R18 in 'AssignReg'

    end
    -- DECOMPILER ERROR at PC270: Overwrote pending register: R16 in 'AssignReg'

    if not l_0_16 or l_0_13 ~= "powershell.exe" then
      if l_0_14 == "svchost.exe" and l_0_15 == "explorer.exe" then
        local l_0_18 = nil
        local l_0_19 = "sensecm.exe"
        -- DECOMPILER ERROR at PC274: Overwrote pending register: R20 in 'AssignReg'

        -- DECOMPILER ERROR at PC279: Overwrote pending register: R18 in 'AssignReg'

        l_0_16, l_0_17 = l_0_16(l_0_17, l_0_18), {l_0_18, l_0_19, "agentexecutor.exe", "winword.exe", "outlook.exe", "powerpnt.exe"}
      end
      if not l_0_16 then
        if l_0_14 == "officeclicktorun.exe" then
          l_0_16 = in_array
          local l_0_20 = nil
          local l_0_21 = nil
          -- DECOMPILER ERROR at PC287: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC288: Overwrote pending register: R19 in 'AssignReg'

          l_0_20 = "outlook.exe"
          l_0_21 = "powerpnt.exe"
          -- DECOMPILER ERROR at PC292: Overwrote pending register: R18 in 'AssignReg'

          l_0_16, l_0_17 = l_0_16(l_0_17, l_0_18), {l_0_18, l_0_19, l_0_20, l_0_21}
        end
        -- DECOMPILER ERROR at PC316: Unhandled construct in 'MakeBoolean' P1

        if ((l_0_16 or (l_0_14 == "csrss.exe" and l_0_15 == "powershell.exe" and l_0_13 == "csc.exe") or (l_0_14 == "csrss.exe" and l_0_15 == "azqualysscancommand.exe" and l_0_13 == "cmd.exe") or (l_0_14 == "microsoft.management.services.intunewindowsagent.exe" and l_0_15 == "agentexecutor.exe" and l_0_13 == "conhost.exe") or l_0_14 == "powershell.exe")) then
          l_0_16 = in_array
          local l_0_22 = nil
          local l_0_23 = nil
          -- DECOMPILER ERROR at PC318: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC319: Overwrote pending register: R19 in 'AssignReg'

          -- DECOMPILER ERROR at PC321: Overwrote pending register: R18 in 'AssignReg'

          l_0_16, l_0_17 = l_0_16(l_0_17, l_0_18), {l_0_18, l_0_19}
          if l_0_16 and l_0_13 == "conhost.exe" then
            l_0_16 = mp
            l_0_16 = l_0_16.CLEAN
            return l_0_16
          end
        end
        l_0_16 = nil
        local l_0_24 = nil
        l_0_17 = isnull
        -- DECOMPILER ERROR at PC332: Overwrote pending register: R18 in 'AssignReg'

        l_0_17 = l_0_17(l_0_18)
        if l_0_17 then
          l_0_17 = has_relationship
          local l_0_25 = nil
          -- DECOMPILER ERROR at PC337: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC338: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC339: Overwrote pending register: R19 in 'AssignReg'

          l_0_18 = l_0_18(l_0_19)
          local l_0_26 = nil
          local l_0_27 = nil
          l_0_20 = l_0_9
          l_0_17, l_0_19 = l_0_17(l_0_18, l_0_19), {l_0_20}
          l_0_16 = l_0_17
        else
          do
            l_0_17 = has_relationship
            local l_0_28 = nil
            l_0_18 = bm
            l_0_18 = l_0_18.get_process_relationships
            l_0_19 = l_0_7
            l_0_18 = l_0_18(l_0_19)
            local l_0_29 = nil
            local l_0_30 = nil
            do
              local l_0_31 = nil
              l_0_21 = l_0_10
              l_0_17, l_0_20, l_0_19 = l_0_17(l_0_18, l_0_19, l_0_20), {l_0_21}, {}
              l_0_16 = l_0_17
              l_0_17 = isnull
              l_0_18 = l_0_16
              l_0_17 = l_0_17(l_0_18)
              if not l_0_17 then
                l_0_17 = isnull
                l_0_18 = l_0_16.parent
                l_0_17 = l_0_17(l_0_18)
                if not l_0_17 then
                  l_0_17 = isnull
                  l_0_18 = l_0_16.parent
                  l_0_18 = l_0_18.ppid
                  l_0_17 = l_0_17(l_0_18)
                  if not l_0_17 then
                    l_0_17 = "created"
                    l_0_18 = l_0_16.parent
                    -- DECOMPILER ERROR at PC376: Overwrote pending register: R10 in 'AssignReg'

                    l_0_11 = l_0_17
                  else
                    l_0_17 = isnull
                    l_0_18 = l_0_16
                    l_0_17 = l_0_17(l_0_18)
                    if not l_0_17 then
                      l_0_17 = isnull
                      l_0_18 = l_0_16.inject
                      l_0_17 = l_0_17(l_0_18)
                      if not l_0_17 then
                        l_0_17 = isnull
                        l_0_18 = l_0_16.inject
                        l_0_18 = l_0_18.ppid
                        l_0_17 = l_0_17(l_0_18)
                        if not l_0_17 then
                          l_0_17 = "injected"
                          l_0_18 = l_0_16.inject
                          -- DECOMPILER ERROR at PC397: Overwrote pending register: R10 in 'AssignReg'

                          l_0_11 = l_0_17
                        end
                      end
                    end
                  end
                  if l_0_11 == "created" then
                    l_0_17 = in_array
                    local l_0_32 = nil
                    local l_0_33 = nil
                    l_0_19 = "cmd.exe"
                    l_0_20 = "powershell.exe"
                    l_0_19 = l_0_15
                    l_0_17, l_0_18 = l_0_17(l_0_18, l_0_19), {l_0_19, l_0_20}
                    if l_0_17 then
                      l_0_17 = mp
                      l_0_17 = l_0_17.CLEAN
                      return l_0_17
                    end
                  end
                  do
                    l_0_17 = isnull
                    l_0_18 = l_0_10
                    l_0_17 = l_0_17(l_0_18)
                    if not l_0_17 then
                      l_0_17 = bm
                      l_0_17 = l_0_17.trigger_sig_target_propagate
                      l_0_18 = string
                      l_0_18 = l_0_18.format
                      l_0_19 = "ProcessReparent %s from %s to %s as new parent of: %s"
                      l_0_20 = l_0_11
                      l_0_21 = l_0_10
                      l_0_22 = l_0_7
                      l_0_23 = l_0_0
                      l_0_18 = l_0_18(l_0_19, l_0_20, l_0_21, l_0_22, l_0_23)
                      l_0_19 = l_0_8
                      l_0_20 = l_0_10
                      l_0_17(l_0_18, l_0_19, l_0_20)
                    end
                    l_0_17 = mp
                    l_0_17 = l_0_17.CLEAN
                    return l_0_17
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

