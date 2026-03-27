-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5dd773d2957f\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles ~= nil then
    local l_0_1 = (mp.GetParentProcInfo)()
    if l_0_1 ~= nil and l_0_1.image_path ~= nil and l_0_1.ppid ~= nil then
      local l_0_2 = (string.lower)(l_0_1.image_path)
      if l_0_2:match("([^\\]+)$") == "netbird.exe" then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

