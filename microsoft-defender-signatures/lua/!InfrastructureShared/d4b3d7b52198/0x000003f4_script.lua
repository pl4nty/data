-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d4b3d7b52198\0x000003f4_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
    local l_0_0 = nil
    if l_0_0 ~= nil and IsTacticObservedForPid(l_0_0, "TaintedIISInstance") then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

