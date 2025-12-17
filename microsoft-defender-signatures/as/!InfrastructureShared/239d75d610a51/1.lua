-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\239d75d610a51\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and not isnull(l_0_0.ppid) then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  if (l_0_2 == "w3wp.exe" or l_0_2 == "sqlservr.exe" or l_0_2 == "httpd.exe" or l_0_2 == "java.exe" or (string.find)(l_0_2, "tomcat", 1, true) or (string.find)(l_0_2, "apache", 1, true)) and IsDeviceHVA() then
    local l_0_3 = ""
    local l_0_4 = ExtractDeviceProperties()
    if l_0_4.DeviceRoles ~= nil and l_0_4.IsInternetFacing == true then
      for l_0_8,l_0_9 in pairs(l_0_4.DeviceRoles) do
        l_0_3 = l_0_3 .. ";" .. l_0_8
      end
      ;
      (MpCommon.BmTriggerSig)(l_0_0.ppid, "HvaRoles!", l_0_3)
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

