-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3db3372208e4\0x00000342_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  do
    if l_0_0 ~= nil then
      local l_0_1 = (string.lower)(l_0_0)
      if (string.find)(l_0_1, "ldap://", 1, true) or (string.find)(l_0_1, "ldaps://", 1, true) then
        TrackPidAndTechniqueBM("BM", "T1069.002", "Discovery_DomainGroups")
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

