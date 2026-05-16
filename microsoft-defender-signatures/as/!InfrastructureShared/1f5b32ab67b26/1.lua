-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f5b32ab67b26\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and isParentPackageManager(l_0_0.ppid, true) then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if l_0_1 ~= nil and ((string.match)(l_0_1, "/k3s$") or (string.match)(l_0_1, "/containerd$") or (string.match)(l_0_1, "/containerd%-shim")) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
do
  if l_0_2 ~= nil and l_0_2.image_path ~= nil then
    local l_0_3 = l_0_2.image_path
    if (string.match)(l_0_3, "/k3s$") or (string.match)(l_0_3, "/containerd$") or (string.match)(l_0_3, "/containerd%-shim") then
      return mp.CLEAN
    end
  end
  do
    local l_0_4, l_0_5, l_0_6, l_0_8, l_0_10, l_0_12 = l_0_0 and l_0_0.command_line or ""
    do
      local l_0_7, l_0_9, l_0_11, l_0_13 = , l_0_2 ~= nil and (mp.GetProcessCommandLine)(l_0_2.ppid) or ""
      -- DECOMPILER ERROR at PC96: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC105: Confused about usage of register: R3 in 'UnsetPending'

      -- DECOMPILER ERROR at PC114: Confused about usage of register: R4 in 'UnsetPending'

      -- DECOMPILER ERROR at PC123: Confused about usage of register: R4 in 'UnsetPending'

      if ((string.find)(l_0_7, "/opt/aquasec/", 1, true) and (string.find)(l_0_7, "aquasec-agent", 1, true)) or (string.find)(l_0_9, "/opt/aquasec/", 1, true) and (string.find)(l_0_9, "aquasec-agent", 1, true) then
        return mp.CLEAN
      end
      addRelatedProcess()
      reportRelatedBmHits()
      return mp.INFECTED
    end
  end
end

