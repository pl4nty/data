-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ffb3d4066ad4\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3, l_0_4, l_0_5 = nil
  else
  end
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil then
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

    -- DECOMPILER ERROR at PC47: Confused about usage of register: R0 in 'UnsetPending'

    if (sysio.IsFileExists)((this_sigattrlog[5]).utf8p2) and (mp.IsKnownFriendlyFile)((this_sigattrlog[5]).utf8p2, true, false) == false then
      (bm.add_threat_file)((this_sigattrlog[5]).utf8p2)
    end
    local l_0_6, l_0_7 = , pcall(reportBmInfo)
    -- DECOMPILER ERROR at PC63: Overwrote pending register: R6 in 'AssignReg'

    if not l_0_7 and reportBmInfo then
      (bm.add_related_string)("bmInfoFailReason", tostring(R6_PC61), R6_PC61)
    end
    return mp.INFECTED
  end
end

