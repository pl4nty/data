-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\157d7e99506f6\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles and ((l_0_0.DeviceRoles).DomainController ~= nil or (l_0_0.DeviceRoles).Dns ~= nil) then
    local l_0_1 = (mp.GetScannedPPID)()
    if not l_0_1 then
      return mp.CLEAN
    end
    local l_0_2 = (MpCommon.GetImagePathFromPid)(l_0_1)
    if l_0_2 ~= nil then
      do
        do
          if (string.find)((string.lower)(l_0_2), "esentutl.exe", 1, true) then
            local l_0_3 = (string.lower)((mp.GetProcessCommandLine)(l_0_1))
            if isnull(l_0_3) then
              return mp.CLEAN
            end
            if not (string.find)(l_0_3, "/y ", 1, true) and not (string.find)(l_0_3, "/vss ", 1, true) then
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

