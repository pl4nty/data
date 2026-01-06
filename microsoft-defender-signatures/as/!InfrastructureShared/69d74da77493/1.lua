-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69d74da77493\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = ExtractDeviceProperties()
  if l_0_0.DeviceRoles ~= nil then
    if IsProcNameInParentProcessTree("cmdhstr", "ltsvc.exe") then
      return mp.CLEAN
    end
    local l_0_1 = {}
    -- DECOMPILER ERROR at PC23: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC24: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC26: Overwrote pending register: R4 in 'AssignReg'

    if ("winrshost.exe")("wsmprovhost.exe", "wmiprvse.exe") then
      return mp.INFECTED
    end
  end
end
do
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

