-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\197d7286ba48d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
do
  if IsDeviceHVA() then
    local l_0_1 = ExtractDeviceProperties()
    if l_0_1.DeviceRoles and ((l_0_1.DeviceRoles).DomainController ~= nil or (l_0_1.DeviceRoles).Dns ~= nil) then
      l_0_0 = true
    end
  end
  if not l_0_0 and IsActiveDirectoryRole() then
    l_0_0 = true
  end
  if l_0_0 then
    local l_0_2 = (mp.GetScannedPPID)()
    if not l_0_2 then
      return mp.CLEAN
    end
    local l_0_3 = (MpCommon.GetImagePathFromPid)(l_0_2)
    if l_0_3 ~= nil then
      do
        do
          if (string.find)((string.lower)(l_0_3), "esentutl.exe", 1, true) then
            local l_0_4 = (string.lower)((mp.GetProcessCommandLine)(l_0_2))
            if isnull(l_0_4) then
              return mp.CLEAN
            end
            if not (string.find)(l_0_4, "/y ", 1, true) and not (string.find)(l_0_4, "/vss ", 1, true) then
              return mp.CLEAN
            end
          end
          do return mp.INFECTED end
          return mp.CLEAN
        end
      end
    end
  end
end

