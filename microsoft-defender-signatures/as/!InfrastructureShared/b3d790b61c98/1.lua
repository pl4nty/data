-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b3d790b61c98\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC4: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC5: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC6: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC7: Overwrote pending register: R3 in 'AssignReg'

if ("psexesvc.exe")("wsmprovhost.exe", "wmiprvse.exe") and IsDeviceHVA() and ((ExtractDeviceProperties()).DeviceRoles).DomainController ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

