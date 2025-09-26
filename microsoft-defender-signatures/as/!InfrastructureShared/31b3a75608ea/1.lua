-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\31b3a75608ea\1.luac 

-- params : ...
-- function num : 0
if IsDeviceHVA() then
  local l_0_0 = {}
  local l_0_1 = ExtractDeviceProperties()
  if l_0_1.DeviceRoles ~= nil then
    for l_0_5,l_0_6 in pairs(l_0_1.DeviceRoles) do
      (table.insert)(l_0_0, l_0_5)
    end
    ;
    (bm.add_related_string)("HVA_Roles", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

