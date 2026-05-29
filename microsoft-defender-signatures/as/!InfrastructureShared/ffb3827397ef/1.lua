-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ffb3827397ef\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = function(l_1_0, l_1_1)
  -- function num : 0_0
  do
    if l_1_0 ~= nil then
      local l_1_2 = (string.find)(l_1_0, l_1_1, 1, true)
    else
    end
    return false
  end
end

do
  local l_0_2, l_0_3, l_0_4, l_0_5 = (bm.get_imagepath)() or ""
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

  if l_0_2 ~= "" and ((string.match)(l_0_2, "/k3s$") or (string.match)(l_0_2, "/containerd$") or (string.match)(l_0_2, "/containerd%-shim")) then
    return mp.CLEAN
  end
  local l_0_6 = nil
  do
    local l_0_7, l_0_8, l_0_9, l_0_10, l_0_11, l_0_12, l_0_13, l_0_14, l_0_15, l_0_16, l_0_18, l_0_20, l_0_21, l_0_24, l_0_27 = , (mp.GetParentProcInfo)() ~= nil and ((mp.GetParentProcInfo)()).image_path or ""
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC63: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC70: Confused about usage of register: R4 in 'UnsetPending'

    -- DECOMPILER ERROR at PC77: Confused about usage of register: R4 in 'UnsetPending'

    if l_0_8 ~= "" and ((string.match)(l_0_8, "/k3s$") or (string.match)(l_0_8, "/containerd$") or (string.match)(l_0_8, "/containerd%-shim")) then
      return mp.CLEAN
    end
    do
      local l_0_17, l_0_19, l_0_22, l_0_25, l_0_28 = , l_0_0 ~= nil and l_0_0.command_line or ""
      -- DECOMPILER ERROR at PC91: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC95: Confused about usage of register: R3 in 'UnsetPending'

      do
        local l_0_23, l_0_26, l_0_29 = nil
        -- DECOMPILER ERROR at PC113: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC119: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC131: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC143: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC150: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC150: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC150: Unhandled construct in 'MakeBoolean' P3

        -- DECOMPILER ERROR at PC150: Unhandled construct in 'MakeBoolean' P3

        if (l_0_1(l_0_6, "/opt/kaspersky/kesl/") and l_0_1(l_0_6, "/libexec/kesl")) or not l_0_1(l_0_26, "/opt/kaspersky/kesl/") or l_0_1(l_0_26, "/sophos/engine/_/savscand.") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC158: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_6, "/opt/VRTSralus/bin/beremote") or l_0_1(l_0_26, "/opt/VRTSralus/bin/beremote") then
          return mp.CLEAN
        end
        -- DECOMPILER ERROR at PC173: Confused about usage of register: R4 in 'UnsetPending'

        -- DECOMPILER ERROR at PC179: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC191: Confused about usage of register: R5 in 'UnsetPending'

        -- DECOMPILER ERROR at PC197: Confused about usage of register: R4 in 'UnsetPending'

        if l_0_1(l_0_6, "/usr/bin/xClient") or ((l_0_1(l_0_6, "/usr/bin/nice") and l_0_1(l_0_29, "/usr/bin/xClient ")) or not l_0_1(l_0_26, "/usr/bin/nice") or l_0_1(l_0_17 ~= nil and (mp.GetProcessCommandLine)(l_0_17.ppid) or "", "/usr/bin/xClient ")) then
          return mp.CLEAN
        end
        addRelatedProcess()
        reportRelatedBmHits()
        return mp.INFECTED
      end
    end
  end
end

