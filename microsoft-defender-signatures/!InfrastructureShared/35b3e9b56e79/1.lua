-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b3e9b56e79\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC4: Overwrote pending register: R0 in 'AssignReg'

do
  if IsADConnectRole() then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

  do
    if not IsADConnectCloudSyncRole() or IsADFSRole() then
      local l_0_1, l_0_2 = "Ad Connect Cloud Sync"
    end
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

    if l_0_1 == nil then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

    ;
    (bm.add_related_string)("HybridServerRole", l_0_1, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end

