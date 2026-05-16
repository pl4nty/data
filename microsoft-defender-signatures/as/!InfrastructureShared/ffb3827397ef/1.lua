-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ffb3827397ef\1.luac 

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
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end

