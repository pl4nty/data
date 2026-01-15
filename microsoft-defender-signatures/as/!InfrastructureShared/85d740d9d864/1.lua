-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\85d740d9d864\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
if IsDeviceHVA() then
  local l_0_1 = ExtractDeviceProperties()
  if l_0_1.DeviceRoles and ((l_0_1.DeviceRoles).DomainController ~= nil or (l_0_1.DeviceRoles).Dns ~= nil) then
    l_0_0 = true
  end
else
  do
    if IsActiveDirectoryRole() then
      l_0_0 = true
    end
    do
      do
        if l_0_0 then
          local l_0_2 = {}
          -- DECOMPILER ERROR at PC33: No list found for R1 , SetList fails

          -- DECOMPILER ERROR at PC34: Overwrote pending register: R2 in 'AssignReg'

          -- DECOMPILER ERROR at PC35: Overwrote pending register: R3 in 'AssignReg'

          -- DECOMPILER ERROR at PC36: Overwrote pending register: R4 in 'AssignReg'

          if ("winrshost.exe")("wsmprovhost.exe", "wmiprvse.exe") then
            return mp.INFECTED
          end
        end
        do return mp.CLEAN end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

